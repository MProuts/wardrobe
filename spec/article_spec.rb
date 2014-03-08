require File.dirname(__FILE__) + '/spec_helper'
require 'rack/test'
load 'Rakefile'

describe Article do
  # let(:app) { subject }
  include Rack::Test::Methods
  
  let(:params) { { 
    "article" => { 
      "article_type" => "shoe",
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
    let(:new_article) { 
      Article.create(:article_type => "shoe",
                   :subtype => "sandal", 
                   :brand => "Chacos",
                   :color => "blue",
                   :image_url => "chacos.jpg")
    }

    it "should render the edit form" do
      get "articles/#{new_article.id}/edit"

      expect(last_response.body).to include("chacos.jpg")
    end
  end

  describe 'POST /articles/:id' do
    it "should update article's attribue in the database and redirect to show page" do
      docs = Article.create(:article_type => "boot",
                   :subtype => "combat boot", 
                   :brand => "Doc Martin's",
                   :color => "black", 
                   :image_url => "docs.jpg")
      post "articles/#{docs.id}/edit", { "article" => { "color" => "yellow" } }
      binding.pry
      follow_redirect!

      expect(Article.find_by_article_type("boot").color).to eq("yellow")
      expect(last_response.body).to include("yellow")
    end
  end

  describe "DELETE /articles/:id" do
    let(:params) do {
      :article_type => "shoes",
      :subtype => "clogs",
      :brand => "Birkenstocks",
      :color => "brown", 
      :image_url => "birks.jpg"
    }
    end

    it "should delete the specified article from the database" do
      
      birkenstocks = Article.create( params )

      count = Article.all.count
      delete "articles/#{birkenstocks.id}"
      expect(Article.all.count).to eq(count - 1)
    end

    it "should redirect to the index page" do

      birkenstocks = Article.create( params )
      delete"articles/#{birkenstocks.id}"
      follow_redirect!

      expect(last_response.body).to include("Articles")
    end

  end

end


