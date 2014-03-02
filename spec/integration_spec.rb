require 'spec_helper'
require 'capybara/rspec'
require 'capybara/dsl'
load 'Rakefile'

#sets Sinatra::Application.environment = :test
set :environment, :test

describe "Integration" do
  include Capybara::DSL

  before(:all) do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
  end

  after(:all) do
    FileUtils.rm('./db/test.db')
  end


  describe "from homepage", :type => :feature do
    Capybara.app = Sinatra::Application

    describe "from index page" do
      it "should link to show pages" do
        visit '/articles'
        click_link('article_1')

        expect(page.has_content?('brand_1')).to be_true
      end
    end

    describe "from show page" do
      it "should link back to index" do
        visit '/articles/1'
        click_link("Back")

        expect(page.current_path).to eq("/articles")
      end

      it "should link to edit page" do
        visit '/articles/1'
        click_link("Edit")

        expect(page.current_path).to eq("/articles/1/edit")
      end

      it "should link to destroy article" do
        visit '/articles/1'
        click_button("Delete")

        expect(page.current_path).to eq("/articles")
        expect(page.has_content?("brand_1")).to be_false
      end
    end
  end
end
