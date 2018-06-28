class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    special_characters_removed = self.name.gsub(/[$&+,:;=?@#|'<>.^*()%!]/, '')
    special_characters_removed.gsub(/[\s]/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |genre|
      genre.slug == slug
    end
  end

end
