require_relative '../spec_helper'

describe UsersController do

  describe 'get /login' do
    it "should render the login form"
  end

  describe 'get /register' do
    before do
      get '/register'
    end

    it "should respond with status ok" do
      expect(last_response).to be_ok
    end

    it "should render the sign up form" do
      expect(last_response.body).to include("Register")
    end
  end
  
  describe 'get /user/:username' do
  end
end
