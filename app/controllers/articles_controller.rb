class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_attributes, only: [:create]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.reverse_chrono
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @articles = Article.reverse_chrono
    if @article_attributes
      @article = Article.create(@article_attributes)
    else
      @article = Article.new
      @article.errors.add(:url, "Invalid url")
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  # def update
  #   respond_to do |format|
  #     if @article.update(article_params)
  #       format.html { redirect_to @article, notice: 'Article was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @article }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @article.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /articles/1
  # DELETE /articles/1.json
  # def destroy
  #   @article.destroy
  #   respond_to do |format|
  #     format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
    # Use callbacks to share common setup or constraints between actions.
    # def set_article
    #   @article = Article.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def set_attributes
      url = params[:article][:url]
      heading = Article.get_title(url)
      if heading
        @article_attributes = 
        {
          url: url,
          heading: Article.get_title(url) 
        }
      end
    end
end