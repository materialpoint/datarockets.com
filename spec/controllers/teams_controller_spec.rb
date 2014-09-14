require 'rails_helper'

describe TeamsController do
  describe '#show' do
    it 'return all users' do
      member = Fabricate(:user)
      admin = Fabricate(:user_admin)

      get :show

      expect(assigns(:team)).to eq([member, admin])
    end
  end
end
