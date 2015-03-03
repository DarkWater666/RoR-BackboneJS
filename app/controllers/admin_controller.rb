class AdminController < ApplicationController

  authorize_resource :class => :Admin
  layout 'admin'

  def index
  end


end
