
require './config/environment' # or require relative

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#use Rack::MethodOveride 
use Rack::Session::Cookie, :key => 'rack.session',
                           :domain => 'foo.com',
                           :path => '/',
                           :expire_after => 2592000, #Comment lol
                           :secret => 'change_me'

use SessionsController
use PostsController
use UsersController
run ApplicationController