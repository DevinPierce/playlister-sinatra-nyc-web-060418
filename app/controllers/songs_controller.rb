require 'rack-flash'
class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do

    @artist = Artist.find_or_create_by(name: params[:song][:artist][:name])

    @song = Song.create(name: params[:song][:name])

    params[:genres].each do |genre_id|
      Genre.find(genre_id.to_i).songs << @song
    end
    
    @artist.songs << @song
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end



end
