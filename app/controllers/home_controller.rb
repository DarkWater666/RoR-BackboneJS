class HomeController < ApplicationController

  authorize_resource :class => :Home

  def index
  end

end
