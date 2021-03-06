class PanelsController < ApplicationController
  before_action :set_panel, only: [:show, :edit, :update, :destroy]

  # GET /panels
  # GET /panels.json
  def index
    @panels = Panel.all
    unless session[:votes].blank? 
      session[:votes] = []
    end
  end

  # GET /panels/1
  # GET /panels/1.json
  def show
  end

  # GET /panels/new
  def new
    @panels = Panel.order('vote DESC')
    @panel = Panel.new
  end

  # GET /panels/1/edit
  def edit
  end

  # POST /panels
  # POST /panels.json
  def create
    @panel = Panel.new(panel_params)
    @panel.vote = 0
    session[:shared] = true


    if(panel_params[:actor] == "true")
      @panel.actor = "palestrante"
    else
      @panel.actor = "tema"
    end

    respond_to do |format|
      if @panel.save
        format.html { redirect_to :back, notice: 'Sucesso =)' }
      else
        format.html { redirect_to :back, alert: 'Esse título já existe.' }
      end
    end
  end

  def voting
    @panel = Panel.find(params[:id])

    if !session[:votes].include? params[:id]
      @panel.vote = @panel.vote + 1
      @panel.save

      session[:votes] << params[:id]
    end

    respond_to do |format|      
      format.html { redirect_to "", notice: 'Sucesso =)' }
    end
  end

  # PATCH/PUT /panels/1
  # PATCH/PUT /panels/1.json
  def update
    respond_to do |format|
      if @panel.update(panel_params)
        format.html { redirect_to @panel, notice: 'Panel was successfully updated.' }
        format.json { render :show, status: :ok, location: @panel }
      else
        format.html { render :edit }
        format.json { render json: @panel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /panels/1
  # DELETE /panels/1.json
  def destroy
    @panel.destroy
    respond_to do |format|
      format.html { redirect_to panels_url, notice: 'Panel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panel
      @panel = Panel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def panel_params
      params.require(:panel).permit(:title, :description, :actor, :vote)
    end
end
