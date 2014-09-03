require 'rails_helper'

describe Admin::PostsController, type: :controller do
  let(:_post) { Fabricate(:post) }

  describe 'GET #index' do
    it_requires_authentication do
      get :index
    end

    for_user :admin do
      it 'loads all the posts and sorts them by created_at in desc order' do
        first, second = Fabricate(:post), Fabricate(:post)

        get :index

        expect(assigns(:posts)).to eq([second, first])
      end
    end
  end

  describe 'GET #new' do
    it_requires_authentication do
      get :new
    end

    for_user :admin do
      it 'loads new post' do
        get :new

        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  end

  describe 'POST #create' do
    it_requires_authentication do
      post :create, post: Fabricate.attributes_for(:post).slice(:title, :body)
    end

    for_user :admin do
      it 'creates post with valid params' do
        post :create, post: Fabricate.attributes_for(:post).slice(:title, :body)

        expect(assigns(:post)).to be_persisted
      end

      it 'does not create post with invalid params' do
        post :create, post: { title: nil, body: nil }

        expect(assigns(:post)).not_to be_persisted
      end
    end
  end

  describe 'GET #edit' do
    it_requires_authentication do
      get :edit, id: _post.id
    end

    for_user :admin do
      it 'loads the requested post' do
        get :edit, id: _post.id

        expect(assigns(:post)).to be_persisted
      end
    end
  end

  describe 'PUT/PATCH #update' do
    it_requires_authentication do
      patch :update, id: _post.id, post: { title: 'updated post' }
    end

    for_user :admin do
      it 'loads the requested post' do
        patch :update, id: _post.id, post: { title: 'updated post' }
      end

      it 'updates post with valid params' do
        patch :update, id: _post.id, post: { title: 'updated post' }

        expect(_post.reload.title).to eq('updated post')
      end
    end

    it 'does not update post with invalid params' do
      patch :update, id: _post.id, post: { title: nil }

      expect(_post.reload.title).not_to eq(nil)
    end
  end

  describe 'DELETE #destroy' do
    it_requires_authentication do
      delete :destroy, id: _post.id
    end

    for_user :admin do
      it 'deletes post' do
        delete :destroy, id: _post.id

        expect(assigns(:post)).not_to be_persisted
      end
    end
  end
end
