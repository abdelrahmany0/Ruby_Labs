class ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    # puts current_user.id
    if user_signed_in?
      puts 'signed in'
    else
      puts 'not signed in'
    end
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    # @user = User.find(params[:user_id])
    # byebug
    @article = Article.new(article_params.merge(user_id: current_user.id))
    # @article = Article.new(params.require(:article).permit(:title, :text))
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
