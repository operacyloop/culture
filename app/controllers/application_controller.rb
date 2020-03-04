#require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "culture_culmae"
  end

# end

#   get '/' do
#     session[:greeting] = "Hello World"
#     response.set_cookie 'credit_amount', '100'
#     "Hello World!"
#   end

#   get '/remember' do 
#     "You have #{request.cookies['credit_amount']} left to something"
#   end 

   helpers do 

     def logged_in?
     #!!session[:email]
      !!current_user 
    end

#     def current_user 
#       @current_user ||= User.find_by(:email => session[:email]) if session[:email]
#     end

    # post '/users.html' do
    #   "Hello World"
    #   # erb :"views/people"
    # end

    def login(email, password)
       # check if a user with email / password
      # if so, set the session
        # need to go over agsain
        # ISSUES HERE >>> FIX THIS NEXT LINE
      if user = User.find_by(:email => email) && user.authenticate(password)
        session[:email] = user.email 
      else 
        redirect '/login'
      end  
    end 

#     def logout!
#       session.clear
#     end
  end

#   # class ApplicationController
#   #   post '/users.html' do
#   #     "Hello World"
#   #   end
#   # end

#   # get "/" do
#   #   # session[:greeting] = "Hello World"
#   #   @posts = ["Family", "Entrprenuerial", "Structured", "Traditional", "Team-oriented", "Performance"]
#   #   #erb :welcome
#   #   "Hello World!"
#   # end

#   # post '/sessions' do
#   #   session[:email] = params[:email]
#   #   redirect '/posts'
#   # end

#   # get '/remember' do
#   #   session[:greeting]
#   # end

#   #post '/people' do
#     # "The assessments are of the following person: #{params[:name]} <br>" +
#     # "Here are the ratings of each of the traits:"
#     #  "Timeliness: &nbsp &nbsp #{params[:favorite_food]} <br>" +
#     #  "Self-reliance: &nbsp &nbsp #{params[:trait02]} <br>" +
#     #  "Reliability: &nbsp &nbsp #{params[:trait03]} <br>" +
#     #  "Courage: &nbsp &nbsp #{params[:trait04]} <br>" +
#     #  "Honesty: &nbsp &nbsp #{params[:trait05]} <br>" +
#     #  "Tact: &nbsp &nbsp #{params[:trait06]} <br>" +
#     #  "Work Ethic: &nbsp &nbsp #{params[:trait07]} <br>" +
#     #  "Charm: &nbsp &nbsp #{params[:trait08]} <br>" +
#     #  "Sense of humor: &nbsp &nbsp #{params[:trait09]} <br>" +
#     #  "Fun to be around: &nbsp &nbsp #{params[:trait10]} <br>" +
#     #  "Trustworthy: &nbsp &nbsp #{params[:trait11]} <br>" +
#     #  "Self-confidence: &nbsp &nbsp #{params[:trait12]} <br>" +
#     #  "Ability to work 'Smarter-not-harder': &nbsp &nbsp #{params[:trait13]} <br>" +
#     #  "Willingness to help others: &nbsp &nbsp  #{params[:trait14]} <br>" +
#     #  "Gets along with others: &nbsp &nbsp #{params[:trait15]} <br>" +
#     #  "Considerate of others: &nbsp &nbsp  #{params[:trait16]} <br>" +
#     #  "Ability to confront appropriately: &nbsp &nbsp  #{params[:trait17]} <br>" +
#     #  "Acceptance of others dispite their differences: &nbsp &nbsp #{params[:trait18]} <br>" +
#     #  "Willingness to take responsibility for own actions: &nbsp &nbsp #{params[:trait19]} <br>" +
#     #  "Self-understanding: &nbsp &nbsp  #{params[:trait20]} <br>" +
#     #  "Willingness to improve themselves: &nbsp &nbsp #{params[:trait21]} <br>"
#    # erb :people
#  # end

#   #get '/teams' do
#   #  erb :teams
#   #end

#   #get "/people" do
#   #  erb :people
#  # end

end
