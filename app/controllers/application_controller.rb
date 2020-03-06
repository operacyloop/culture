#require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "culture_culmae"
    register Sinatra::Flash
  end

   get '/' do
     redirect '/login'
   end

   helpers do 

    def logged_in?
      !!current_user 
    end

    def current_user 
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized_to_edit?(post)
      post.user == current_user 
    end 

    def login(email, password)
        # ISSUES HERE >>> FIX THIS NEXT LINE
      if (user = User.find_by(:email => email)) && user.authenticate(password)
        session[:email] = user.email 
      else 
        redirect '/login'
      end  
    end 

    def logout!
      session.clear
    end
  end
end