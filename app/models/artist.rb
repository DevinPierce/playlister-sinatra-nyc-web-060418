class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    special_characters_removed = self.name.gsub(/[$&+,:;=?@#|'<>.^*()%!]/, '')
    special_characters_removed.gsub(/[\s]/, '-').downcase
  end

  def self.find_by_slug(slug)
    self.all.find do |artist|
      artist.slug == slug
    end
  end

end
