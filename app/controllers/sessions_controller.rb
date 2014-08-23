class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: user_email)
    session[:remember_token] = user.remember_token

    redirect_to(root_path)
  end

  def destroy
  end

  private

    def user_email
      request.env['omniauth.auth'][:info][:email]
    end
end
