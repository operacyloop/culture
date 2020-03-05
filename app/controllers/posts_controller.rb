class PostsController < ApplicationController

  get '/posts' do 
    # Checking if they are logged in
    if !logged_in?
      
      redirect "/login" # Redirecting if they aren't 
    else 
      erb :'posts/index.html'
    end
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    # if we save correctly, then...
    post = Post.new(title: params[:title], content: params[:content], tact_rating: params[:tact_rating])
    if post.save
      redirect "/posts/#{post.id}"
    else 
    # if the post doesn't save...  
      erb :'posts/new'
    end
  end 

  get '/posts/:id' do
    @post = Post.find_by(id: params[:id])
    erb :'posts/show'
  end 

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