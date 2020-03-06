
require './config/environment' # or require relative

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride 

run ApplicationController
use SessionsController
use PostsController
use UsersController
