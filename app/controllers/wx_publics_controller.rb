class WxPublicsController < ApplicationController
  before_action :set_wx_public, only: [:show, :edit, :update, :destroy]

  # GET /wx_publics
  # GET /wx_publics.json
  def index
    @wx_publics = WxPublic.all
  end

  # GET /wx_publics/1
  # GET /wx_publics/1.json
  def show
  end

  # GET /wx_publics/new
  def new
    @wx_public = WxPublic.new
  end

  # GET /wx_publics/1/edit
  def edit
  end

  # POST /wx_publics
  # POST /wx_publics.json
  def create
    @wx_public = WxPublic.new(wx_public_params)

    respond_to do |format|
      if @wx_public.save
        format.html { redirect_to @wx_public, notice: 'Wx public was successfully created.' }
        format.json { render :show, status: :created, location: @wx_public }
      else
        format.html { render :new }
        format.json { render json: @wx_public.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wx_publics/1
  # PATCH/PUT /wx_publics/1.json
  def update
    respond_to do |format|
      if @wx_public.update(wx_public_params)
        format.html { redirect_to @wx_public, notice: 'Wx public was successfully updated.' }
        format.json { render :show, status: :ok, location: @wx_public }
      else
        format.html { render :edit }
        format.json { render json: @wx_public.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wx_publics/1
  # DELETE /wx_publics/1.json
  def destroy
    @wx_public.destroy
    respond_to do |format|
      format.html { redirect_to wx_publics_url, notice: 'Wx public was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wx_public
      @wx_public = WxPublic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wx_public_params
      params.require(:wx_public).permit(:nickname, :manager, :alias)
    end
end
