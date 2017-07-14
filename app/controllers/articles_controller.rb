class ArticlesController < ApplicationController
  # Within the controller, we have access to a method named params which
  # returns us a hash of the request parameters.
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    #fail (Use fail to see what data is send to this method)
    # Creating an article
    # Option 1
    # @article = Article.new
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]
    #
    # Option 2
    # @article = Article.new(
    #     title: params[:article][:title],
    #     body: params[:article][:title])
    # Option 3
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' Deleted!"

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params) # similar to Article.new, automatically saves changes

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end


end
