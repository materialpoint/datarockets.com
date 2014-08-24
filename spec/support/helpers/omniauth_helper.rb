module Helpers
  module OmniauthHelper
    def mock_omniauth_for(user, provider: :google_oauth2)
      OmniAuth.config.mock_auth[provider] = {
        provider: provider,
        uid: Faker::Number.number(3),
        info: {
          name: user.name,
          email: user.email,
        },
        credentials: {
          token: SecureRandom.hex
        }
      }.with_indifferent_access
    end
  end
end
