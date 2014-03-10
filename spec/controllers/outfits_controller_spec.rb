require_relative '../spec_helper'

describe OutfitsController do
  # index
  describe 'get /outfits' do
    it "it should serve the request" do
      get '/outfits' 

      expect(last_response).to be_ok
    end

    it "should list all the outfits" do
      get '/outfits'

      expect(last_response.body).to include("outfits")
    end
  end

  # new form
  describe 'get /outfits/new' do 
    it "should serve the response" do
      get '/outfits/new'

      expect(last_response).to be_ok
    end

    it "should render the new outfit form" do
      get '/outfits/new'

      expect(last_response.body).to include("slider")
    end
  end

  # (C)reate
  describe 'post /outfits' do
    before do
      @a1 = Article.create(:subtype => "sweater")
      @a2 = Article.create(:subtype => "jeans")
      post '/outfits', 
        { "outfit" => {
               "article_ids"=>[@a1.id, @a2.id], "date_worn"=>"2014-03-09" } }
    end

    it "should create a new outfit with approriate associated articles" do
      expect(Outfit.first.articles).to include(@a1) 
    end

    it "should redirect to the outfits index page" do
      follow_redirect!

      expect(last_response.body).to include("Outfit History")
    end
  end

  # (R)ead
  describe 'get /outfits/:id' do
    before do 
      @o= Outfit.create(:date_worn => Date.today)
      get "/outfits/#{@o.id}"
    end

    it "should render the appropriate outfit's show page" do
      expect(last_response).to be_ok
      expect(last_response.body).to include(Kronic.format(Date.today))
    end
  end

  # edit form
  describe 'get /oufits/:id/edit' do
    before do
      @o= Outfit.create(:date_worn => Date.today)
      get "/outfits/#{@o.id}/edit"
    end

    it "should render the edit form page" do
      expect(last_response.body).to include("Edit Outfit")
    end
  end

  # (U)pdate
  describe 'put /outfits/:id' do
    before do
      @o = Outfit.create(:date_worn => Date.today)
      put "/outfits/#{@o.id}", 
        { "outfit" => {
               "date_worn"=>"1900-03-09" } }
    end

    it "should update appropriate attributes" do
      expect(Outfit.find(@o.id).date_worn.to_s).to eq("1900-03-09")
    end

    it "should redirect to the outfit's show page" do
      follow_redirect!
      
      expect(last_response.body).to include("1900-03-09")
    end
  end

  # (D)elete
  describe 'delete /outfits/:id' do
    before do
      @o = Outfit.create(:date_worn => Date.today)
    end

    it "should delete the appropriate record" do
      delete "/outfits/#{@o.id}"

      expect(Outfit.all.count).to eq(0)
    end

    it "should redirect to the index page" do
      delete "/outfits/#{@o.id}"
      follow_redirect!

    expect(last_response.body).to include("Outfit History")
    end
  end

end
