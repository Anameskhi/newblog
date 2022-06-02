class ArticlesController < ApplicationController
  before_action :current_user
  
  def index
    @articles = Article.order(created_at: :desc).all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = @current_user.articles.new(article_params)
    #@article = Article.new(article_params)
  
    if @article.save
      redirect_to root_path, notice: "article added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end



 
end
