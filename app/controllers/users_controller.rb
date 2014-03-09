class UsersController < ApplicationController
  get '/users/new' do
    redirect to '/register'
  end

  get '/register' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(params["user"])

    redirect to "/users/#{@user.username}"
  end

  get '/users/:username' do
    @user = User.find_by(:username => params["username"])

    erb :'users/show'
  end

  get '/users/:username/edit' do
    @user = User.find_by(:username => params["username"])

    erb :'users/edit'
  end

  put '/users/:username' do
    @user = User.find_by(:username => params["username"])
    @user.update_attributes(params["user"])

    redirect to "/users/#{@user.username}"
  end

  delete '/users/:username' do
    @user = User.find_by(:username => params["username"]).destroy

    redirect to "/register"
  end
end
