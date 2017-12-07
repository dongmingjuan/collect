class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show,  :update, :destroy]
  load_and_authorize_resource
  layout 'admin'
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.order_by(:created_at.desc)
    @articles = @articles.full_text_search(params[:search]) unless params[:search].blank?
    @articles = @articles.page params[:page]
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @pictures = @article.pictures
    @labels = Label.all.map { |label| [label.name, label.id.to_s] }
  end

  def ascending
    if current_user.role == 'admin'
     @articles = Article.all.page params[:page]
    else
     @articles = current_user.articles.page params[:page]
    end
    @articles = @articles.order_by(:view_count.asc)
    render :index
  end

  def descending
    if current_user.role == 'admin'
     @articles = Article.all.page params[:page]
    else
     @articles = current_user.articles.page params[:page]
    end
    @articles = @articles.order_by(:view_count.desc)
    render :index
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
    @labels = Label.all.map { |label| [label.name, label.id.to_s] }
  end

  # GET /articles/1/edit
  def edit
    @article = Article.all.find(params[:id])
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
        if !params[:pictures].blank?
          params[:pictures]['image'].each do |image|
            @article.pictures.create(image: image)
          end
        end
        format.html { redirect_to articles_url, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        if !params[:pictures].blank?
          params[:pictures]['image'].each do |image|
            @article.pictures.create(image: image)
          end
        end
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :from,  :view_count,  photos_attributes: [:id, :article_id, :image])
    end
end
