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

  get '/outfits/:id' do
    @outfit = Outfit.find(params["id"])

    erb :'outfits/show'
  end

  get '/outfits/:id/edit' do
    @outfit = Outfit.find(params["id"])
    #TODO: GET METAAAA
    @tops = Article.all.where(:article_type_id => 1)
    @bottoms = Article.all.where(:article_type_id => 2)

    erb :'outfits/edit'
  end

  put '/outfits/:id' do
    @outfit = Outfit.find(params["id"])
    @outfit.update_attributes(params["outfit"])

    redirect to "/outfits/#{@outfit.id}"
  end
  
  delete '/outfits/:id' do
    @outfit = Outfit.find(params["id"])
    @outfit.destroy

    redirect to '/outfits'
  end

end
