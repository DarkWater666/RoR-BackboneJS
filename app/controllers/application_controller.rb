class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  require 'net/http'
  add_flash_types :warning, :info
  layout proc{|c| c.request.xhr? ? false : 'application' }

end
