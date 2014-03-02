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

    it "should say hello" do
      visit '/articles'
      click_link('article_1')

      expect(page.has_content?('brand_1')).to be_true
    end
  end
end
