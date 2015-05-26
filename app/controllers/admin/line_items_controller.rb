class Admin::LineItemsController < Admin::AdminController
  # before_filter :authenticate, except: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]


  # GET /admin/line_items
  # GET /admin/line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /admin/line_items/1
  # GET /admin/line_items/1.json
  def show
  end

  # GET /admin/line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /admin/line_items/1/edit
  def edit
  end

  # POST /admin/line_items
  # POST /admin/line_items.json
  def create
    product = Product.find(params[:product_id])
    quantity = params[:quantity]
    # restaurant = Restaurant.find(params[:restaurant_id])

    @existed_item = current_cart.line_items.where(product_id: product.id)
    added_to_existing = @existed_item.any?
    if @existed_item.count > 0
      @line_item = @existed_item.first
      if @line_item && !@line_item.quantity
        @line_item.quantity = 0
      end
      @line_item.increase_quantity(params[:quantity])
    else
      @line_item = current_cart.line_items.build(product_id: product.id, quantity: quantity)
    end


    # @line_item = LineItem.new(line_item_params)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to [:admin, @line_item], notice: 'Line item was successfully created.' }
        format.json {
          str = render_to_string(template: "partials/_one_item_cart.html", locals: {li: @line_item}, layout: false)
          rez = {}

          if added_to_existing
            rez[:added_to_existing] = true
            rez[:quantity] = @line_item.quantity
          else
            rez[:item_template] = str
          end
          render inline: rez.to_json
          # render action: 'show', status: :created, location: @line_item
        }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/line_items/1
  # PATCH/PUT /admin/line_items/1.json
  def update
    product_id = params[:product_id]
    quantity = params[:quantity].to_i
    @line_item = current_cart.line_items.where(product_id: params["product_id"]).first
    # @line_item = LineItem.where(product_id: params["product_id"]).where(cart_id: current_cart.id).first

    respond_to do |format|
      if @line_item && @line_item.update(params)
        format.html { redirect_to [:admin, @line_item], notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/line_items/1
  # DELETE /admin/line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { head :no_content }
      # format.html { redirect_to admin_line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:cart_id, :product_id, :quantity, :restaurant_id)
    end
end
