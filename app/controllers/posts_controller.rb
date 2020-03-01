class PostsController < ApplicationController

  get '/posts' do 
    "You are logged in as #{session[:email]}" +
    ". A list of publicly available posts"
  end

  get '/posts/new' do 
    # Checking if they are logged in
    if !logged_in?
      redirect "/login"
    else 
      "A new post form"
    end
  end
  

    
  
end