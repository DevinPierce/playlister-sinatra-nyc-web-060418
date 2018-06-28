class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    special_characters_removed = self.name.gsub(/[$&+,:;=?@#|'<>.^*()%!]/, '')
    special_characters_removed.gsub(/[\s]/, '-').downcase
  end

end
