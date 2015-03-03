class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  require 'net/http'
  add_flash_types :warning, :info
  layout proc{|c| c.request.xhr? ? false : 'application' }

  after_filter :user_activity
  before_filter :check_guest

  unless Rails.application.config.consider_all_requests_local

    rescue_from Exception do
      render_error 500
    end

    rescue_from ActionController::RoutingError, ActionController::UnknownController, AbstractController::ActionNotFound, ActiveRecord::RecordNotFound do
      render_error 404
    end

    rescue_from ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved, ActionController::InvalidAuthenticityToken do
      render_error 422
    end

  end

  # rescue_from HTTPBadGateway, HTTPBadRequest do
  #   render_error 502
  # end

  rescue_from CanCan::AccessDenied do
    if user_signed_in?
      redirect_to root_path, :alert => 'Недостаточно прав для просмотра этой страницы.'
    else
      redirect_to root_path(anchor: 'admin/login'), :notice => 'Пожалуйста, войдите.'
    end
  end if :devise_controller? || :office_controller? || :registrations_controller?

  protected

    def user_activity
      current_user.try :touch
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:login, :email, :password) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :name, :remember_created_at) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:login, :password, :name, :email, :current_password, :phone, :address) }
    end
    #
    # def flash_to_headers
    #   session['alert'] = flash[:alert]  unless flash[:alert].blank?
    #   session['notice'] = flash[:notice]  unless flash[:notice].blank?
    #   session['info'] = flash[:info]  unless flash[:info].blank?
    #   session['warning'] = flash[:warning]  unless flash[:warning].blank?
    # end

    def check_guest
      cookies[:counter].present? ? cookies[:counter]=cookies[:counter].to_i+1 : cookies[:counter]=1
      # cookies[:counter]=0
    end


    def render_error(status)
      case status.to_i
        when 404
          redirect_to not_found_path
        when 500
          redirect_to server_error_path
        when 422
          redirect_to unprocessable_entity_path
        when 502
          redirect_to bad_gateway_path
        else
          redirect_to bad_gateway_path
      end
      # respond_to do |format|
      #   format.html { render template: "errors/error_#{status}", layout: 'layouts/error', status: status }
      #   format.all { render nothing: true, status: status }
      # end
    end

end
