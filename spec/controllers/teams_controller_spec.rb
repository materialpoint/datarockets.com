require 'rails_helper'

describe TeamsController do
  describe '#show' do
    it 'return all users' do
      member = Fabricate(:user)

      get :show

      expect(assigns(:team)).to eq([member])
    end
  end
end
