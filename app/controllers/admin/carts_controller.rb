class Admin::CartsController < Admin::AdminController
  before_filter :authenticate
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /admin/carts
  # GET /admin/carts.json
  def index
    @carts = Cart.all
  end

  # GET /admin/carts/1
  # GET /admin/carts/1.json
  def show
  end

  # GET /admin/carts/new
  def new
    @cart = Cart.new
  end

  # GET /admin/carts/1/edit
  def edit
  end

  # POST /admin/carts
  # POST /admin/carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to [:admin, @cart], notice: 'Cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/carts/1
  # PATCH/PUT /admin/carts/1.json
  def update
    # _cart_params = cart_params
    # if current_user && current_cart.user_id.blank?
    #   _cart_params[:user_id] = current_user.id
    # end
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to [:admin, @cart], notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/carts/1
  # DELETE /admin/carts/1.json
  def destroy
    @cart.try(:destroy)
    respond_to do |format|
      format.html { redirect_to admin_carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      #@cart = Cart.find(params[:id])
      @cart = current_cart
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:user_id, :order_number, :status, :finished_at)
    end
end
