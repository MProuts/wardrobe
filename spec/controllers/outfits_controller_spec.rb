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
      post '/outfits', 
    end

    it "should create a new outfit" do
    end
  end
end
