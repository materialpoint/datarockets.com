class ApplicationController < ActionController::Base
  include AuthenticationConcern
  include Pundit

  protect_from_forgery with: :exception

  self.responder = AppResponder
  respond_to :html

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  private

    # Scope translation by controller and action names.
    # If you call st('notice') from sessions#create it will look for
    # translation for key 'flash.sessions.create.notice'.
    def st(key)
      I18n.t(key, scope: [:flash, params[:controller], params[:action]])
    end

    def user_not_authorized
      flash[:alert] = t('errors.unauthenticated')
      redirect_to root_path
    end
end
