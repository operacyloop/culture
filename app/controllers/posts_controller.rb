class PostsController < ApplicationController
  

  delete '/posts/:id' do 
    set_post_entry
    if authorized_to_edit?(@post)
      @post.destroy 
      redirect '/posts'
    else
      redirect '/posts'
    end
  end

  patch '/posts/:id' do
    #"Hello World (located in now in post_controller.rb)"
    #1. find the entry
    set_post_entry
    #2. update the entry
    #@post_entry.update(params)
    if logged_in?
      if @post.user == current_user && params[:content] != "" && params[:title] != "" && params[:title] != ""
        @post.update(content: params[:content], title: params[:title], tact_rating: params[:tact_rating])
        redirect "/posts/#{@post.id}"
      else  
        redirect "users/#{current_user.id}"
      end 
      @post.update(params)
    end
    #3. redirect to show page
    #redirect "/post/#{@post_entry.id}"
  end  

  # get '/index.html' do
  #   "Hello world - get '/index.html' do"
  #   #erb :'post/index.html'
  # end
  
  get '/posts' do

    @posts = Post.all
    #"Hello world - get '/index' do"
    erb :'/posts/index'

    # "All da posts: supposed to show all the posts: Hello World"
    #@posts = Post.all 
    #erb :'view/post/index'
  end 

  # get '/posts' do 
  #   # Checking if they are logged in
  #   if !logged_in?
      
  #     redirect "/login" # Redirecting if they aren't 
  #   else 
  #     erb :'posts/index.html'
  #   end
  # end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    # first, make sure they're signed in. No? Send 'em back to log in page.
    #  nd
    # if we save correctly, then...
    user = current_user 
    if params[:title] != "" && params[:content] != "" && params[:tact_rating] != ""
      post = user.posts.build(title: params[:title], content: params[:content], tact_rating: params[:tact_rating])
      if post.save
        redirect "/posts/#{post.id}"
      else 
      # if the post doesn't save...  
        erb :'/posts/new'
      end
    else  
      erb :'/posts/new'
    end 
  end 

  get '/posts/:id' do
    set_post_entry
    erb :'/posts/show'
  end 

  #This route should send us to edit.erb which will render an edit form
  get '/posts/:id/edit' do 
    set_post_entry
    if logged_in? 
      if authorized_to_edit?(@post)
        erb :'/posts/edit'
      else
        # FIX THIS PLEASE
        "within 'get '/posts/:id/edit' do'"
        #redirect "users/#{current_user.id}" 
      end 
    else  
      redirect '/'
    end 
  end 


    #erb :'/posts/edit'
    # Checking if they are logged in
    # if !logged_in? 
    #   redirect "/login" # Redirecting if not
    # else  
    #   #how do I find the post that only the author is allowed to edit
    #   if post = current_user.posts.find_by(params[:id])
    #     "An edit post form #{current_user.id} is editing #{post.id}" # rendering if they are
    #   else
    #     redirect '/posts'
    #   end 
    # end 
   
  #end
end

#Sinatra told me to add
# patch '/posts/' do
#   "Hello World POST"
# end

# patch '/posts/' do
#   "Hello World "
# end


  # set_post_entry
  # if authorized_to_edit(@post)
  #   @post.destroy 
  #   redirect '/posts'
  # else
  #   redirect '/posts'
  # end
# end 


private

def set_post_entry
  @post = Post.find_by(id: params[:id])
end 

get '/posts' do
  @posts = post.all
  erb :'index.html'
end