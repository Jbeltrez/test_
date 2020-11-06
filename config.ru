require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride 
# the above must be placed above all controllers in which you want access to the
# middlewares functionality. 

use PatientsController 
use PrescriptionsController 
run ApplicationController
