module CurrentCart
  extend ActiveSupport::Concern

    private
      def set_cart

        @cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        @cart = Cart.create
        # if user_signed_in?
        #   @cart.user = current_user
        # end
        session[:cart_id] = @cart.id
      end
end