require_relative '../spec_helper'

describe OutfitsController do
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
end
