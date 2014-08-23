require 'rails_helper'

describe SessionsController do
  describe '#create' do
    it 'with valid omniauth hash creates sessions' do
      user = User.create(email: 'dima.zhlobo@datarockets.com', name: 'Dmitry Zhlobo')
      mock_omniauth_hash_for(user)

      get :create, provider: :google_oauth2

      expect(session[:remember_token]).to eq(user.remember_token)
    end
  end

  def mock_omniauth_hash_for(user)
    OmniAuth.config.mock_auth[:google_oauth2] = {
      provider: 'google_oauth2',
      uid: '123545',
      info: {
        name: user.name,
        email: user.email,
      },
      credentials: {
        token: SecureRandom.hex
      }
    }.with_indifferent_access
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end
end
