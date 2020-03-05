class PostsController < ApplicationController

  get '/posts' do 
    # "A list of publicly available posts"
    # "You are logged in as #{session[:email]}"
    erb :'posts/index.html'
  end

  # post -> has_many :tags
  # tag -> 


  get '/posts' do 
    # Checking if they are logged in
    if !logged_in?
      
      redirect "/login" # Redirecting if they aren't 
    else 
      "A new post form" #rendering if they are
    end
  end

  post '/posts/new' do 
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts/posts' do
    erb :'posts/new'
  end

  # get 'posts/:id' do ...

  get '/posts/:id/edit' do 
    # Checking if they are logged in
    if !logged_in? 
      redirect "/login" # Redirecting if not
    else  
      #how do I find the post that only the author is allowed to edit
      if post = current_user.posts.find_by(params[:id])
        "An edit post form #{current_user.id} is editing #{post.id}" # rendering if they are
      else
        redirect '/posts'
      end 
    end 
  end
  

    
  
end