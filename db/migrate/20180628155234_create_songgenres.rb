class CreateSonggenres < ActiveRecord::Migration
  def change
    create_table :songgenres do |t|
      t.references :song
      t.references :genre
    end
  end
end
