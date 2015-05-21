class Admin::MainBannersController < Admin::AdminController
  before_action :set_main_banner, only: [:show, :edit, :update, :destroy]

  # GET /admin/main_banners
  # GET /admin/main_banners.json
  def index
    @main_banners = MainBanner.all
  end

  # GET /admin/main_banners/1
  # GET /admin/main_banners/1.json
  def show
  end

  # GET /admin/main_banners/new
  def new
    @main_banner = MainBanner.new
  end

  # GET /admin/main_banners/1/edit
  def edit
  end

  # POST /admin/main_banners
  # POST /admin/main_banners.json
  def create
    @main_banner = MainBanner.new(main_banner_params)

    respond_to do |format|
      if @main_banner.save
        format.html { redirect_to [:admin, @main_banner], notice: 'Main banner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @main_banner }
      else
        format.html { render action: 'new' }
        format.json { render json: @main_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/main_banners/1
  # PATCH/PUT /admin/main_banners/1.json
  def update
    respond_to do |format|
      if @main_banner.update(main_banner_params)
        format.html { redirect_to [:admin, @main_banner], notice: 'Main banner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @main_banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/main_banners/1
  # DELETE /admin/main_banners/1.json
  def destroy
    @main_banner.destroy
    respond_to do |format|
      format.html { redirect_to admin_main_banners_url, notice: 'Main banner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_main_banner
      @main_banner = MainBanner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def main_banner_params
      params.require(:main_banner).permit(:name, :layer_background, :layer_1, :layer_2, :layer_3, :title, :description, :position, :published)
    end
end
