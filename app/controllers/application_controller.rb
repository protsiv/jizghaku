class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'mailchimp'

  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  before_action :setup_mcapi

  def setup_mcapi
    @mc = Mailchimp::API.new('2ab6d1de4beea81db13ddcc17e288317-us10')
    @list_id = "00beded4fe"
  end

  protected
      def configure_permitted_parameters
          devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
          devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password, :is_female, :date_of_birth) }
      end

  helper_method :current_cart

  def current_cart
    if current_user.present?
     current_user.current_cart
    else
      Cart.find(session[:cart_id])
    end
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
  end

  helper_method :admin?

  def admin?
    !!current_user.try(:admin?)
  end

end
