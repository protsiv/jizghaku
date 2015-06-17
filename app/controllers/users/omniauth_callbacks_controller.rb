class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    #render inline: request.env["omniauth.auth"].inspect

    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect user, notice: "Signed in!"
    else
      session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :facebook, :all

  # def facebook
  #   @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
  #   if @user.persisted?
  #      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  #      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #    else
  #      session["devise.facebook_data"] = request.env["omniauth.auth"]
  #      redirect_to new_user_registration_url
  #    end
  #
  #
  #   # @user = User.find_for_facebook_oauth request.env["omniauth.auth"]
  #   # if @user.persisted?
  #   #   flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
  #   #   sign_in_and_redirect @user, :event => :authentication
  #   # else
  #   #   flash[:notice] = "authentication error"
  #   #   redirect_to root_path
  #   # end
  # end
  #
  # def vkontakte
  # 	@user = User.find_for_vkontakte_oauth request.env["omniauth.auth"]
  #   if @user.persisted?
  #     flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
  #     sign_in_and_redirect @user, :event => :authentication
  #   else
  #     flash[:notice] = "authentication error"
  #     redirect_to root_path
  #   end
  # end
end
