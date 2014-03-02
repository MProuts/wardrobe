require File.dirname(__FILE__) + '/spec_helper'
require 'rack/test'
load 'Rakefile'

set :environment, :test

describe Article do
  # let(:app) { subject }
  include Rack::Test::Methods
  
  before(:all) do
    Rake::Task["db:migrate"].invoke
  end

  after(:all) do
    FileUtils.rm("./db/test.db")
  end

  let(:params) { { 
    "article" => { 
      "subtype" => "sandal", 
      "brand" => "Gucci", 
      "color" => "teal", 
      "image_url" => "sandal@example.com" }
  } }

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

  # index
  describe '/articles' do
    it "should render index correctly" do
      get '/articles'
      expect(last_response).to be_ok
    end
  end

  # new form
  describe '/articles/new' do
    it "should render new article form" do
      get '/articles/new'
      expect(last_response.body).to include("<form ")
    end
  end

  # (C)reate
  describe 'POST to /articles/new' do 

    describe 'with valid params' do
      before(:each) do
      end

      after(:each) do
      end

      it "should create a new instance of Article" do
        post '/articles/new', params

        expect(last_response.status).to eq(302)
      end

      it "should redirect to posts index" do
        post '/articles/new', params

        expect(last_response.redirect?).to be_true
      end

      it "should save the article to the database" do
        count = Article.all.count
        post '/articles/new', params

        expect(Article.all.count).to eq(count + 1)
      end

      it "should display the new content on the articles index page" do
        post '/articles/new', params
        follow_redirect!

        expect(last_response.body).to include("teal")
      end
    end

    describe 'with invalid params' do
      it "should not save a user to the database" do
        count = Article.all.count
        post '/articles/new', {}

        expect(Article.all.count).to eq(count)
      end
    end
  end

  # (R)ead
  describe '/articles/:id' do
    it "should render appropriate article's show page" do
      Article.create(params["article"])
      article_id = Article.first.id
      get "/articles/#{article_id}"

      expect(last_response.body).to include("Gucci")
    end
  end

  # edit form
  describe "/articles/:id/edit" do
    it "should render the edit form" do
      get "articles/1/edit"

      expect(last_response.body).to include("Edit Article")
    end
  end
end
