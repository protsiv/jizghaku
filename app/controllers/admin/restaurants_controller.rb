class Admin::RestaurantsController < Admin::AdminController
  before_filter :authenticate
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /admin/restaurants
  # GET /admin/restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /admin/restaurants/1
  # GET /admin/restaurants/1.json
  def show
  end

  # GET /admin/restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /admin/restaurants/1/edit
  def edit

  end

  # POST /admin/restaurants
  # POST /admin/restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to [:admin, @restaurant], notice: 'Restaurant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurant }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/restaurants/1
  # PATCH/PUT /admin/restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to [:admin, @restaurant], notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/restaurants/1
  # DELETE /admin/restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to admin_restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :slug, :logo, :position, :about, :main_image, :short_description, :description, :address, :phone_number, :time_of_work)
    end
end
