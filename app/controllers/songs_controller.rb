class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    p params
    @artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    @song = Song.create(name: params[:song][:name])
    @artist.songs << @song




    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end



end
