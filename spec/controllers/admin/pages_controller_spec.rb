require 'rails_helper'

RSpec.describe Admin::PagesController, :type => :controller do
  let(:page) { Fabricate(:page) }

  describe 'GET #index' do
    for_user :admin do
      it 'loads all the pages and sorts it in desc order by created_at' do
        first, second = Fabricate(:page), Fabricate(:page)
        get :index
        expect(assigns(:pages)).to eq([second,first])
      end
    end
  end

  describe 'GET #new' do
    it_requires_authentication do
      get :new
    end

    for_user :admin do
      it 'loads new page' do
        get :new

        expect(assigns(:page)).to be_a_new(Page)
      end
    end
  end

    describe 'POST #create' do
    it_requires_authentication do
      post :create, page: Fabricate.attributes_for(:page).slice(:title, :body)
    end

    for_user :admin do
      it 'creates page with valid params' do
        post :create, page: Fabricate.attributes_for(:page).slice(:title, :body)

        expect(assigns(:page)).to be_persisted
      end

      it 'does not create page with invalid params' do
        post :create, page: { title: nil, body: nil }

        expect(assigns(:page)).not_to be_persisted
      end
    end
  end

  describe 'GET #edit' do
    it_requires_authentication do
      get :edit, id: page.id
    end

    for_user :admin do
      it 'loads the requested page' do
        get :edit, id: page.id

        expect(assigns(:page)).to be_persisted
      end
    end
  end

  describe 'PUT/PATCH #update' do
    it_requires_authentication do
      patch :update, id: page.id, page: { title: 'updated title', body: 'updated body' }
    end

    for_user :admin do
      it 'loads the requested page' do
        patch :update, id: page.id, page: { title: 'updated title', body: 'updated body' }

        expect(assigns(:page)).to eq(page)
      end

      it 'update page with valid params' do
        patch :update, id: page.id, page: { title: 'updated title', body: 'updated body' }

        expect(page.reload.title).to eq('updated title')
      end

      it 'does not update page with invalid params' do
        patch :update, id: page.id, page: { title: nil, body: nil }

        expect(page.reload.title).not_to eq(nil)
      end
    end
  end

  describe 'DELETE #destroy' do
    it_requires_authentication do
      delete :destroy, id: page.id
    end

    for_user :admin do
      it 'deletes page' do
        delete :destroy, id: page.id

        expect(assigns(:page)).not_to be_persisted
      end
    end
  end

end
