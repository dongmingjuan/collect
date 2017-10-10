class LabelsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_label, only: [:show, :edit, :update, :destroy, :active]
  load_and_authorize_resource
   layout 'admin'
  # GET /lables
  # GET /lables.json
  def index
    @labels = Label.all.order_by(:created_at.desc).page params[:page]
  end

  # GET /lables/1
  # GET /lables/1.json
  def show
  end

  # GET /lables/new
  def new
    @label = Label.new
  end

  def active
    @label.update(active: true)
     respond_to do |format|
      format.html { redirect_to labels_path(page: params[:page]), notice: 'label was successfully actived.' }
      format.json { head :no_content }
    end
  end

  def unactive
     @label.update(active: false)
      respond_to do |format|
      format.html { redirect_to labels_path(page: params[:page]), notice: 'label was successfully unactived.' }
      format.json { head :no_content }
    end
  end

  def allactive
    Label.update_all(active: true)
    redirect_to labels_path, notice: 'label was successfully all actived.'
  end

  def ascending
    @labels = Label.all.page params[:page]
    @labels = @labels.order_by(:used_count.asc)
    render :index
  end

  def descending
    @labels = Label.all.page params[:page]
    @labels = @labels.order_by(:used_count.desc)
    render :index
  end

  # GET /lables/1/edit
  def edit
  end

  # POST /lables
  # POST /lables.json
  def create
    @label = Label.new(label_params)

    respond_to do |format|
      if @label.save
        format.html { redirect_to @label, notice: 'Label was successfully created.' }
        format.json { render :show, status: :created, location: @label }
      else
        format.html { render :new }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lables/1
  # PATCH/PUT /lables/1.json
  def update
    respond_to do |format|
      if @label.update(label_params)
        format.html { redirect_to @label, notice: 'Label was successfully updated.' }
        format.json { render :show, status: :ok, location: @label }
      else
        format.html { render :edit }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lables/1
  # DELETE /lables/1.json
  def destroy
    @label.destroy
    respond_to do |format|
      format.html { redirect_to labels_url, notice: 'Label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit(:name, :used_count)
    end
end
