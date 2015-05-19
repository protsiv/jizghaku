class Admin::OrderedListsController < ApplicationController
  before_action :set_ordered_list, only: [:show, :edit, :update, :destroy]

  # GET /admin/ordered_lists
  # GET /admin/ordered_lists.json
  def index
    @ordered_lists = OrderedList.all
  end

  # GET /admin/ordered_lists/1
  # GET /admin/ordered_lists/1.json
  def show
  end

  # GET /admin/ordered_lists/new
  def new
    @ordered_list = OrderedList.new
  end

  # GET /admin/ordered_lists/1/edit
  def edit
  end

  # POST /admin/ordered_lists
  # POST /admin/ordered_lists.json
  def create
    @ordered_list = OrderedList.new(ordered_list_params)

    respond_to do |format|
      if @ordered_list.save
        format.html { redirect_to [:admin, @ordered_list], notice: 'Ordered list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ordered_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @ordered_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/ordered_lists/1
  # PATCH/PUT /admin/ordered_lists/1.json
  def update
    respond_to do |format|
      if @ordered_list.update(ordered_list_params)
        format.html { redirect_to [:admin, @ordered_list], notice: 'Ordered list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ordered_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/ordered_lists/1
  # DELETE /admin/ordered_lists/1.json
  def destroy
    @ordered_list.destroy
    respond_to do |format|
      format.html { redirect_to admin_ordered_lists_url, notice: 'Ordered list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ordered_list
      @ordered_list = OrderedList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ordered_list_params
      params.require(:ordered_list).permit(:uid, :pid, :quantity, :p_status, :total_price)
    end
end
