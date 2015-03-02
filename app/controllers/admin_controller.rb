class AdminController < ApplicationController

  authorize_resource :class => :Admin

  def index
  end

end
