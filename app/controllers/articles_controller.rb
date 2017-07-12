class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # Within the controller, we have access to a method named params which
  # returns us a hash of the request parameters.
end
