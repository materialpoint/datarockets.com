require 'rails_helper'

describe ApplicationController do
  describe '#current_user' do
    it 'returns signed in user' do
      user = Fabricate(:user)
      sign_in(user)

      expect(current_user).to eq(user)
    end

    it 'returns nil if user not signed in' do
      expect(current_user).to eq(nil)
    end

    def current_user
      controller.send(:current_user)
    end
  end

  describe '#user_signed_in?' do
    it 'returns true if user signed in' do
      user = Fabricate(:user)
      sign_in(user)

      expect(user_signed_in?).to eq(true)
    end

    it 'returns false if user not signed in' do
      expect(user_signed_in?).to eq(false)
    end

    def user_signed_in?
      controller.send(:user_signed_in?)
    end
  end

  describe '#authenticate_user!' do
    controller do
      before_action :authenticate_user!

      def index
        render nothing: true, status: :ok
      end
    end

    it 'does nothing for authenticated user' do
      sign_in(Fabricate(:user))

      get :index

      expect(response).to be_successful
    end

    it 'redirects to root path with alert for unauthenticated user' do
      get :index

      expect(response).not_to be_successful
      expect(flash[:alert]).to eq(I18n.t('errors.unauthenticated'))
    end
  end
end
