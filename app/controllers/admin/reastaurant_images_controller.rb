class Admin::ReastaurantImagesController < ApplicationController
  before_action :set_reastaurant_image, only: [:show, :edit, :update, :destroy]

  # GET /admin/reastaurant_images
  # GET /admin/reastaurant_images.json
  def index
    @reastaurant_images = ReastaurantImage.all
  end

  # GET /admin/reastaurant_images/1
  # GET /admin/reastaurant_images/1.json
  def show
  end

  # GET /admin/reastaurant_images/new
  def new
    @reastaurant_image = ReastaurantImage.new
  end

  # GET /admin/reastaurant_images/1/edit
  def edit
  end

  # POST /admin/reastaurant_images
  # POST /admin/reastaurant_images.json
  def create
    @reastaurant_image = ReastaurantImage.new(reastaurant_image_params)

    respond_to do |format|
      if @reastaurant_image.save
        format.html { redirect_to [:admin, @reastaurant_image], notice: 'Reastaurant image was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reastaurant_image }
      else
        format.html { render action: 'new' }
        format.json { render json: @reastaurant_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/reastaurant_images/1
  # PATCH/PUT /admin/reastaurant_images/1.json
  def update
    respond_to do |format|
      if @reastaurant_image.update(reastaurant_image_params)
        format.html { redirect_to [:admin, @reastaurant_image], notice: 'Reastaurant image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reastaurant_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/reastaurant_images/1
  # DELETE /admin/reastaurant_images/1.json
  def destroy
    @reastaurant_image.destroy
    respond_to do |format|
      format.html { redirect_to admin_reastaurant_images_url, notice: 'Reastaurant image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reastaurant_image
      @reastaurant_image = ReastaurantImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reastaurant_image_params
      params.require(:reastaurant_image).permit(:image, :title, :alt)
    end
end
