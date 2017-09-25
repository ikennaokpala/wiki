class ArticlesController < ApplicationController
  def index
    @programming_languages = ProgrammingLanguage.all
    @articles = ArticlesQuery.new(article_params.to_h).get
  end

  def new
    @programming_languages = ProgrammingLanguage.all
  end

  def show
    @article = Article.find(article_params[:id])
  end

  def create
    Article.create(article_params.to_h)
    redirect_to new_article_path
  end

private

  def article_params
    params.permit(:id, :title, :body, :programming_language_id)
  end
end
