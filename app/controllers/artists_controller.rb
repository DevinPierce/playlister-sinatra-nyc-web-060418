class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Song.all
    erb :'artists/index'
  end
end
