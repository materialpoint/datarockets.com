require 'rails_helper'

describe SessionsController do
  describe '#create' do
    it 'show error if user not found' do
      user = Fabricate.build(:user)
      request.env['omniauth.auth'] = mock_omniauth_for(user)

      get :create, provider: :google_oauth2

      expect(flash[:alert]).to eq(I18n.t('flash.sessions.create.user_not_found'))
    end

    it 'with valid omniauth hash creates session' do
      user = Fabricate(:user)
      request.env['omniauth.auth'] = mock_omniauth_for(user)

      get :create, provider: :google_oauth2

      expect(session[:remember_token]).to eq(user.remember_token)
    end
  end

  describe '#destroy' do
    it 'destroys session'
  end
end
