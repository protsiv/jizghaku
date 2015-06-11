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

  def subscription

  end

  def users_list
    @users = User.order(created_at: :asc)
  end

  def authenticate
    unless admin?
      redirect_to root_path
    end
  end

  def subs
    email = params[:email]

    u = User.find_by_email(email)
    @mc.lists.subscribe(@list_id, email: email)
    u.subscribe_to = true
    u.save

    obj = {partial: render_to_string('partials/_unsubscribe', layout: false)}
    render json: obj
  end

  def unsubs
    email = params[:email]

    u = User.find_by_email(email)
    @mc.lists.unsubscribe(@list_id, email: email)
    u.subscribe_to = false
    u.save

    obj = {partial: render_to_string('partials/_subscribe', layout: false)}
    render json: obj
  end

end
