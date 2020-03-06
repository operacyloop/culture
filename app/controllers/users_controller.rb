class UsersController < ApplicationController
  get '/signup' do 
    erb :"users/new.html"
  end 

  get '/users/new.html' do
    erb :"users/new.html"
  end

  post '/users' do

    if params[:email] != "" && params[:password] != ""

      @user = User.new
      @user.email = params[:email]
      @user.password = params[:password]
      if @user.save 
        login(params[:email], params[:password])
        #flash[:message]="You have successfully signed up! Welcome."
        redirect '/posts'
      else 
        erb :"users/new.html"
      end 
    else 
      erb :"users/new.html"
    end
  end
end