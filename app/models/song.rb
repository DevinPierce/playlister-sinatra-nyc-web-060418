class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    special_characters_removed = self.name.gsub(/[$&+,:;=?@#|'<>.^*()%!]/, '')
    added_id = self.id.to_s + special_characters_removed.gsub(/[\s]/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |song|
      song.slug == slug
    end
  end

end
