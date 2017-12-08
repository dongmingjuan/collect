class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  layout 'admin'

  def index
    @pictures = Picture.all.page params[:page]
    unless params[:search].blank?
      article = Article.find_by(title: /#{params[:search]}/)
      unless article.blank?
      @pictures = @pictures.where(article_id: article.id)
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to request.referer , notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def del
    @picture.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
     params.require(:picture).permit(:image)
    end
end
