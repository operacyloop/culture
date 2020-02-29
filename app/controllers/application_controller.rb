require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # params = {
  #   :name => "Johnson" //This is a String and NOT an Integer
  # }

  # get "/hello/:name" do
  #   @user_name = params[:name]
  #   #@user_name = "Barry"
  #   "Hello #{@user_name}!"
  # end

  get "/multiply/:num1/:num2" do 
    "#{params[:num1].to_i*params[:num2].to_i}"
  end

  get "/" do
    @posts = ["Family", "Entrprenuerial", "Structured", "Traditional", "Team-oriented", "Performance"]
    erb :welcome
  end

  get '/teams' do
    erb :teams
  end

  get "/people" do
    erb :people
  end

end
