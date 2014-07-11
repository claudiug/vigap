class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    render json: @articles
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      redirect_to root_url, notice: "article created"
    end
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments

    @comment.article_id = @article.id
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(article_params)
    redirect_to root_url if @article.destroy
  end

  private
  def article_params
    params.require(:article).permit(:id, :title, :text)
  end
end
