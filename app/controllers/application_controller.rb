class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    # Scope translation by controller and action names.
    # If you call st('notice') from sessions#create it will look for
    # translation for key 'flash.sessions.create.notice'.
    def st(key)
      I18n.t(key, scope: [:flash, params[:controller], params[:action]])
    end
end
