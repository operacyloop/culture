class UsersController < ApplicationController
  get '/signup' do 
    erb :"users/new.html"
  end 

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save 
      redirect '/posts'
    else 
      erb :"users/new.html"
    end 
  end
end