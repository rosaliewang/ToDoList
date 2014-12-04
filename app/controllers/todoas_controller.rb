class TodoasController < ApplicationController
  before_action :set_todoa, only: [:show, :edit, :update, :destroy]

  # GET /todoas
  # GET /todoas.json
  def index
    @todoas = Todoa.where(user_id: current_user.id,done: false).order("due, created_at DESC")
  end

  # GET /todoas/today
  # GET /todoas/1.json
  #def show
  #end

  # GET /todoas/new
  def new
    @todo = Todo.new
  end

  # GET /todoas/1/edit
  def edit
  end

  # POST /todoas
  # POST /todoas.json
  def create
    @todoa = Todoa.new(todoa_params)
    @todoa.update_attribute(:user_id, current_user.id)
    @todoa.update_attribute(:done, false)
    respond_to do |format|
      if @todoa.save
        format.html { redirect_to todoas_url }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @todoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todoas/1
  # PATCH/PUT /todoas/1.json
  def update
    respond_to do |format|
      if @todoa.update(todoa_params)
        format.html { redirect_to todoas_url }
        format.json { render :show, status: :ok, location: @todoa }
      else
        format.html { render :edit }
        format.json { render json: @todoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todoas/1
  # DELETE /todoas/1.json
  def destroy
    @todoa.update_attribute(:done, true)
    respond_to do |format|
      format.html { redirect_to todoas_url }
      format.json { head :no_content }
    end
  end

  # Today
  # filter: due
  def today
    @todoas = Todoa.where(user_id: current_user.id,done: false).where('due BETWEEN ? AND ?', Date.today, Date.today)
  end

  # Within A Week
  # filter: due
  def week
    @todoas = Todoa.where(user_id: current_user.id,done: false).where('due BETWEEN ? AND ?', Date.today, Date.today + 7.day)
  end

  def done
    @todone = Todoa.where(user_id: current_user.id, done: true).order("due, created_at DESC").reverse_order
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todoa
      @todoa = Todoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todoa_params
      params.require(:todoa).permit(:content, :due)
    end
end
