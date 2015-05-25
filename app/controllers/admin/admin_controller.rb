class Admin::AdminController < ApplicationController
  #before_action :authenticate_user!

  layout "admin"

  def index
    authenticate_user!
  end

  def purchase_history
    authenticate_user!
    @carts = Cart.where(user_id: current_user.id).where.not(finished_at: nil)
  end

  def users_list
    @users = User.order(created_at: :asc    )
  end

  def authenticate
    unless admin?
      redirect_to root_path
    end
  end

end
