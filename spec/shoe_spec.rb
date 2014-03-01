require File.dirname(__FILE__) + '/spec_helper'
require 'rack/test'

set :environment, :test

describe Shoe do
  include Rack::Test::Methods
  # let(:app) { subject }

  # something rack/test uses to know what the app is called
  def app
    # this is a classic style app
    # in modular this would be AppClass.new
    Sinatra::Application 
  end

  describe "helpers" do
  include ApplicationHelpers

    it "should return title" do
      expect(season).to eq("Winter")
    end
  end

  describe '/shoes' do
    it "should render views correctly" do
      get '/shoes'
      expect(last_response).to be_ok
    end
  end

  describe '/shoes/new' do
    it "should render new shoe form" do
      get '/shoes/new'
      expect(last_response.body).to include("<form ")
    end
  end

  describe 'POST to /shoes/new' do 

    describe 'with valid params' do
      before(:each) do
        @params = { "shoe" => { "subtype" => "sandal", "brand" => "Gucci", "color" => "teal", "image_url" => "sandal@example.com" }}
      end

      after(:each) do
        Shoe.destroy_all
      end

      it "should create a new instance of Shoe" do
        post '/shoes/new', @params

        expect(last_response.status).to eq(302)
      end

      it "should redirect to posts index" do
        post '/shoes/new', @params

        expect(last_response.redirect?).to be_true
      end

      it "should save the shoe to the database" do
        count = Shoe.all.count
        post '/shoes/new', @params

        expect(Shoe.all.count).to eq(count + 1)
      end

      it "should display the new content on the shoes index page" do
        post '/shoes/new', @params
        follow_redirect!

        expect(last_response.body).to include("teal")
      end
    end

    describe 'with invalid params' do
      it "should not save a user to the database" do
        count = Shoe.all.count
        post '/shoes/new', {}

        expect(Shoe.all.count).to eq(count)
      end
    end
  end
end
