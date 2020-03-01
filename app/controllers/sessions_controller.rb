class SessionsController < ApplicationController

  get '/login' do 
    erb :"sessions/login.html"
  end 

  post '/sessions' do 
    #login a user with this email
    login(params[:email]) #was>> #session[:email] = params[:email]
    redirect '/posts'
  end

  get '/logout' do 
    logout!
    redirect '/posts'
  end 

end