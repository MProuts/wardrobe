class UsersController < ApplicationController
  get '/register' do
    erb :'users/new'
  end
end
