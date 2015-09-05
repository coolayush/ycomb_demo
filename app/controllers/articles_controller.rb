class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_attributes, only: [:create]
  before_filter :check_logged_in, except: [:index]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.reverse_chrono
    @articles_liked = current_user.articles 
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
    if @article_attributes
      @article = Article.new(@article_attributes)
      if(@article.save)
        flash.now[:notice] = "Sucussfully added article"
        @articles = Article.reverse_chrono
      else
        flash.now[:error] = @article.errors.messages.values.join(" , ")  
        @article = nil
      end
    else
      @article = nil
      flash.now[:error] = "Invalid Url"
    end
  end

  def liked
    @article = Article.find(params[:id])
    unless current_user.articles.include?(@article)
      current_user.articles << @article
    end
  end

  def unliked
    @article = Article.find(params[:id])
    if current_user.articles.include?(@article)
      current_user.articles.delete(@article)
    end
  end

  private

  def check_logged_in
    unless current_user
      @user = User.new
      redirect_to new_session_path
    end
  end
    
  def set_attributes
    url = params[:article][:url]
    heading = Article.get_title(url)
    if heading
      @article_attributes = 
      {
        url: url,
        title: Article.get_title(url) 
      }
    end
  end

end
