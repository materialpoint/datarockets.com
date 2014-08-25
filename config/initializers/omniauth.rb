Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
    AppConfig.omniauth['google_oauth2']['key'],
    AppConfig.omniauth['google_oauth2']['secret']
end
