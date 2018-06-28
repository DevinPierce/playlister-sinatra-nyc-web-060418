# Add seed data here. Seed your database with `rake db:seed`
require 'pry'

Song.destroy_all
Artist.destroy_all
Genre.destroy_all
SongGenre.destroy_all
LibraryParser.parse

luis_fonsi = Artist.create(name: "Luis Fonsi")
despacito = Song.create(name: "Despacito")
luis_fonsi.songs << despacito
Genre.find_by(name: 'pop').songs << despacito
Genre.find_by(name: 'dance').songs << despacito
