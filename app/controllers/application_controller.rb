class ApplicationController < ActionController::Base
  include AuthenticationConcern

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  private

    # Scope translation by controller and action names.
    # If you call st('notice') from sessions#create it will look for
    # translation for key 'flash.sessions.create.notice'.
    def st(key)
      I18n.t(key, scope: [:flash, params[:controller], params[:action]])
    end
end
