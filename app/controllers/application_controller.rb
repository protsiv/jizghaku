class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?


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
  # def current_cart
  #   @current_cart ||= find_cart
  # end
  #
  # def find_cart
  #   cart = Cart.find_by(id: session[:cart_id])
  #   unless  cart.present?
  #     cart = Cart.create
  #   end
  #   session[:cart_id] = cart.id
  #   cart
  # end

end
