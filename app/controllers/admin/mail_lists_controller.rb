class Admin::MailListsController < Admin::AdminController
  before_filter :authenticate
  before_action :set_mail_list, only: [:show, :edit, :update, :destroy]

  # GET /admin/mail_lists
  # GET /admin/mail_lists.json
  def index
    @mail_lists = MailList.all
  end

  # GET /admin/mail_lists/1
  # GET /admin/mail_lists/1.json
  def show
  end

  # GET /admin/mail_lists/new
  def new
    @mail_list = MailList.new
  end

  # GET /admin/mail_lists/1/edit
  def edit
  end

  # POST /admin/mail_lists
  # POST /admin/mail_lists.json
  def create
    @mail_list = MailList.new(mail_list_params)

    respond_to do |format|
      if @mail_list.save
        format.html { redirect_to [:admin, @mail_list], notice: 'Mail list was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mail_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @mail_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/mail_lists/1
  # PATCH/PUT /admin/mail_lists/1.json
  def update
    respond_to do |format|
      if @mail_list.update(mail_list_params)
        format.html { redirect_to [:admin, @mail_list], notice: 'Mail list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mail_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/mail_lists/1
  # DELETE /admin/mail_lists/1.json
  def destroy
    @mail_list.destroy
    respond_to do |format|
      format.html { redirect_to admin_mail_lists_url, notice: 'Mail list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_list
      @mail_list = MailList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_list_params
      params.require(:mail_list).permit(:call_order, :order_product)
    end
end
