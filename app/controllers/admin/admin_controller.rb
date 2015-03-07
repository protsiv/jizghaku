class Admin::AdminController < ApplicationController
  before_action :authenticate_user!

  layout "admin"

  def index
  end

  def purchase_history
    @carts = Cart.where(user_id: current_user.id)
  end

end
