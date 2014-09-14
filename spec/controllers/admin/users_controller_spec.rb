require 'rails_helper'

describe Admin::UsersController do
  let(:user) { Fabricate(:user) }

  describe 'GET #index' do
    for_user :admin do
      it 'loads all the users and sorts them by created_at in desc order' do
        first, second = Fabricate(:user), Fabricate(:user_admin)

        get :index

        expect(assigns(:users)).to eq([second, first, user])
      end
    end
  end

  describe 'GET #new' do
    it_requires_authentication do
      get :new
    end

    for_user :admin do
      it 'loads new user' do
        get :new

        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe 'POST #create' do
    it_requires_authentication do
      post :create, user: Fabricate.attributes_for(:user).slice(:email, :name)
    end

    for_user :admin do
      it 'creates user with valid params' do
        post :create, user: Fabricate.attributes_for(:user).slice(:email, :name)

        expect(assigns(:user)).to be_persisted
      end

      it 'does not create user with invalid params' do
        post :create, user: { email: nil}

        expect(assigns(:user)).not_to be_persisted
      end
    end
  end

  describe 'GET #edit' do
    it_requires_authentication do
      get :edit, id: user.id
    end

    for_user :admin do
      it 'loads the requested user' do
        get :edit, id: user.id

        expect(assigns(:user)).to be_persisted
      end
    end
  end

  describe 'PUT/PATCH #update' do
    it_requires_authentication do
      patch :update, id: user.id, user: { name: 'updated name' }
    end

    for_user :admin do
      it 'loads the requested user' do
        patch :update, id: user.id, user: { name: 'updated name' }

        expect(assigns(:user)).to eq(user)
      end

      it 'update user with valid params' do
        patch :update, id: user.id, user: { name: 'updated name' }

        expect(user.reload.name).to eq('updated name')
      end

      it 'does not update user with invalid params' do
        patch :update, id: user.id, user: { email: nil }

        expect(user.reload.email).not_to eq(nil)
      end
    end
  end

  describe 'DELETE #destroy' do
    it_requires_authentication do
      delete :destroy, id: user.id
    end

    for_user :admin do
      it 'deletes user' do
        delete :destroy, id: user.id

        expect(assigns(:user)).not_to be_persisted
      end
    end
  end
end
