require_relative '../spec_helper'

describe OutfitsController do
  describe 'outfits' do
    it "it should serve the request" do
      get '/outfits' 

      expect(last_response).to be_ok
    end

    it "should list all the outfits" do
      get '/outfits'

      expect(last_response.body).to include("outfits")
    end
  end
end
