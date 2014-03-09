require_relative '../spec_helper'

describe UsersController do

  describe 'get /login' do
    it "should render the login form" do
      pending
    end
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

  describe 'post /users' do
    before do
      post "/users", {"user" => {
                          "username" => "example",
                          "email" => "example@example.com" } }
    end

    it "should create a new user with params" do
      expect(User.first.username).to eq("example")
    end

    it "should redirect to the new user's show page" do
      follow_redirect!

      expect(last_response.body).to include("example")
    end
  end
  
  describe 'get /user/:username' do
    pending "implied above!"
  end
  
  describe 'get /user/:username/edit' do
    before do
      User.create(:username => "example", :email => "user@example.com")
      get 'users/example/edit'
    end

    it "should serve request" do
      expect(last_response).to be_ok
    end

    it "should render the edit form" do
      expect(last_response.body).to include("Edit User")
    end
  end

  describe 'post /users/:username' do
    before do 
      @user = User.create(:username => "Michael", :email => "michael@example.com")
      put "/users/#{@user.username}", { "user" => {
                                           "username" => "Andrew" } }
    end

    it "should update approprate user in the database" do
      expect(User.first.username).to eq("Andrew")
    end

    it "should redirect to the user's updated show page" do
      follow_redirect!

      expect(last_response.body).to include("Andrew")
    end
  end

  describe 'delete /users/:username' do
    before do
      @user = User.create(:username => "Michael", :email => "michael@example.com")
    end

    it "should remove the specified user from the database" do
      delete "/users/#{@user.username}" 

      expect(User.all.count).to eq(0)
    end

    it "should redirect to the registration page" do
      delete "/users/#{@user.username}" 
      follow_redirect!

      expect(last_response.body).to include("Register")
    end
  end


end
