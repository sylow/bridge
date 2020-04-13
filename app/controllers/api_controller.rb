class ApiController < ActionController::API 
  include Trailblazer::Rails::Controller  
  include Response
  include ExceptionHandler
end