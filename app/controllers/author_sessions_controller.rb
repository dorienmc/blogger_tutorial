class AuthorSessionsController < ApplicationController
  # Render login page
  def new
  end

  # Log in
  # Try to log in using login(), then redirect to articles_path if logged in, or try again.
  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: 'Logged in successfully.')
    else
      flash.now.alert = 'Login failed.'
      render action: :new
    end
  end

  # Log out
  def destroy
    logout
    redirect_to(:authors, notice: 'Logged out.')
  end
end
