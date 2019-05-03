class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

  def new
    @article = Article.new
  end
  
  def edit
   
  end
  
  def create
  #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      redirect_to articles_path 
    else
      redirect_to new_article_path
    end
  end

  
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated"
      redirect_to article_path(@article)
    else
      flash[:notice] = "Article was not updated"
      render 'edit'
    end
  end

  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end

  
  def destroy
    if @article.destroy
      flash[:notice] = "Article was destroy"
      redirect_to article_path(@article)
    else
      flash[:notice] = "Article was not destroy"
      render 'destroy'
    end
  end
end