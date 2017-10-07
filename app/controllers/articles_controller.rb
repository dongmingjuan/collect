class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show,  :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = current_user.articles.page params[:page]
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
    @labels = Label.all.map { |label| [label.name, label.id.to_s] }
  end

  # GET /articles/1/edit
  def edit
    @article = current_user.articles.find(params[:id])
    @labels = Label.all.map { |label| [label.name, label.id.to_s] }

  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)
    selected_labels = Label.in(id: params["checked_labels"].try(:values))
    @article.labels << selected_labels

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :from,  :view_count)
    end
end
