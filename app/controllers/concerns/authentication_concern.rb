module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    %i(authenticate_user! current_user user_signed_in?).each do |method_name|
      private method_name
      helper_method method_name
    end
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to(root_path, alert: t('errors.unauthenticated'))
    end
  end

  def current_user
    @_current_user ||= User.find_by(remember_token: session[:remember_token])
  end

  def user_signed_in?
    current_user.present?
  end
end
