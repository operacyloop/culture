class UsersController < ApplicationController
  get '/signup' do 
    erb :"users/new.html"
  end 

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save 
      flash[:message]="You have successfully signed up! Welcome."
      redirect '/posts'
    else 
      erb :"users/new.html"
    end 
  end
end