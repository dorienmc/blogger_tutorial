module ArticlesHelper

  # Method used to filter out which parameters from the front-end we want to accept/require
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
