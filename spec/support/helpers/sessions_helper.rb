module Helpers
  module SessionsHelper
    def sign_in(user)
      session[:remember_token] = user.remember_token
    end
  end
end
