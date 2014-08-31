require 'rails_helper'

describe TeamsController do
  describe '#show' do
    it 'return all members' do
      member = Fabricate(:user_member)
      Fabricate(:user_admin) #need for checking filter

      get :show

      expect(assigns(:members)).to eq([member])
    end
  end
end
