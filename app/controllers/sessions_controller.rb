class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: omniauth_email)
    if user.present?
      create_session(user)
      redirect_to(root_path, notice: st(:successfully_signed_in))
    else
      redirect_to(root_path, alert: st(:user_not_found))
    end
  end

  def destroy
    destroy_session
    redirect_to(root_path, notice: st(:successfully_signed_out))
  end

  private

    def omniauth_email
      request.env['omniauth.auth'][:info][:email]
    end

    def create_session(user)
      session[:remember_token] = user.remember_token
    end

    def destroy_session
      session.delete(:remember_token)
    end
end
