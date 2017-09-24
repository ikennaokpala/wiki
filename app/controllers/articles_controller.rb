class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new; end

  def create
    Article.create(article_params.to_h)
    redirect_to new_article_path
  end

private

  def article_params
    params.permit(:title, :body)
  end
end
