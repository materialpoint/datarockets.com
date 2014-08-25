module SessionsHelper
  def omniauth_path(provider)
    "/auth/#{provider}"
  end
end
