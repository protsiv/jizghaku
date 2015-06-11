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
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :card, :subscribe_to,:password_confirmation, :last_name, :email, :password, :phone) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :card, :subscribe_to,:password_confirmation, :last_name, :email, :password, :phone, :current_password, :is_female, :date_of_birth) }
    end

  helper_method :current_cart

  def current_cart
    @_current_cart ||= nil

    if @_current_cart
      return @_current_cart
    end

    c = Cart.where(id: session[:cart_id]).first
    if c && c.finished_at?
      cart = Cart.create
      session[:cart_id] = cart.id
      c = cart
    end

    if c.nil? && current_user.present?
      c = current_user.current_cart
    end

    if c.nil?
      cart = Cart.create
      session[:cart_id] = cart.id
      c = cart
    end

    @_current_cart = c
    if @_current_cart.user_id.blank? && current_user
      @_current_cart.user = current_user
      @_current_cart.save
    end
    @_current_cart
  end

  helper_method :admin?

  def admin?
    !!current_user.try(:admin?)
  end

  # def configure_permitted_parameters  #Adding my params to devise
  #    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :card, :subscribe_to,:password_confirmation]
  #  end
end
