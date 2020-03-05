class SessionsController < ApplicationController

  get '/login' do 
    erb :"sessions/login.html"
  end 

  post '/sessions' do 
    #login a user with this email
    # PROBLEMS WITH NEXT LINE >>> 
    login(params[:email], params[:password]) #was>> #session[:email] = params[:email]
      redirect '/posts/new'
  end

  get '/show' do
    erb :'posts/show'
  end


  get '/logout' do 
    logout!
    redirect '/posts'
  end 

  get '/signup' do
     erb :"users/new.html"
  end 

end