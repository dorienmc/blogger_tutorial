class ArticlesController < ApplicationController
  # Within the controller, we have access to a method named params which
  # returns us a hash of the request parameters.
  include ArticlesHelper

  # Require login for new, create, edit, update and destroy. But not for index, show
  before_filter :require_login, except: [:index, :show] #or only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new #cannot use article.comments.new as that already saves the empty comment and shows it
    @comment.article_id = @article.id #need to manually assign id because of 'mass-assignment'
    #mass-assignment: assigning multiple values to attributes via a single assignment operator, which can lead to assignments that should not be allowed
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
