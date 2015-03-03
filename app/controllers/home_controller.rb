class HomeController < ApplicationController

  authorize_resource :class => :Home

  def index
    @log = params[:log] ? true : false
  end

  def registrations_fancy
    respond_to do |format|
      format.js { render 'registrations.coffee' }
      format.html { redirect_to root_path }
    end
  end

end
