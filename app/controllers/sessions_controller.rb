class SessionsController < ApplicationController

  get '/login' do 
    if logged_in?
      redirect '/posts'
    else 
      erb :"sessions/login.html"
    end 
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
    redirect '/'
  end 

  get '/signup' do
    if logged_in?
      redirect '/posts'
    else 
     erb :"users/new.html"
    end 
  end 

end