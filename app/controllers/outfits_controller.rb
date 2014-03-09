class OutfitsController < ApplicationController
  get '/outfits' do
    @outfits = Outfit.all.order(:date_worn => :desc)

    erb :'outfits/index'
  end

  get '/outfits/new' do
    #TODO: GET METAAAA
    @tops = Article.all.where(:article_type_id => 1)
    @bottoms = Article.all.where(:article_type_id => 2)

    erb :'outfits/new'
  end

  post '/outfits' do
    Outfit.create(params["outfit"])

    redirect to '/outfits'
  end

  

end
