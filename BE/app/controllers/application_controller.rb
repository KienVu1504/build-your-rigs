class ApplicationController < ActionController::API
  include Authenticable
  include Response
end
