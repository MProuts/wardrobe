class OutfitsController < ApplicationController
  get '/outfits' do
    @outfits = Outfit.all

    erb :'outfits/index'
  end

  get '/outfits/new' do
    @articles = Article.all

    erb :'outfits/new'
  end
  

end
