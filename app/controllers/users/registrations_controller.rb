class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  self.layout "admin", except: [:create, :new]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    email = params[:user][:email]

    if params[:subscribe_to] == true
      @mc.lists.subscribe(@list_id, email: email)
    end
  end

  # GET /resource/edit

  # def resource_name
  #   "user"
  # end
  # def edit
  #   super
  #   #render :edit, :layout => 'admin'
  # end

  # PUT /resource
  def update
    super
    email = params[:user][:email]

    if params[:subscribe_to] == true &&  current_user.subscribe_to == false
      @mc.lists.subscribe(@list_id, email: email)
    else if params[:subscribe_to] == false &&  current_user.subscribe_to == true
      @mc.lists.unsubscribe(@list_id, email: email)
    end
    end
  end

  # DELETE /resource
  def destroy
    super
    email = current_user.email
    if current_user.subscribe_to == true
      @mc.lists.unsubscribe(@list_id, email: email)
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
