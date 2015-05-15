class Admin::ReviewsController < Admin::AdminController
  before_filter :authenticate
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /admin/reviews
  # GET /admin/reviews.json
  def index
    @reviews = Review.all
  end

  # GET /admin/reviews/1
  # GET /admin/reviews/1.json
  def show
  end

  # GET /admin/reviews/new
  def new
    @review = Review.new
  end

  # GET /admin/reviews/1/edit
  def edit
  end

  # POST /admin/reviews
  # POST /admin/reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to [:admin, @review], notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @review }
      else
        format.html { render action: 'new' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/reviews/1
  # PATCH/PUT /admin/reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to [:admin, @review], notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/reviews/1
  # DELETE /admin/reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to admin_reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:name, :image, :description, :published, :position)
    end
end
