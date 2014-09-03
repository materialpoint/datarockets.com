require 'rails_helper'

describe Blog::PostsController, type: :controller do
  let(:post) { Fabricate(:post) }

  describe 'GET #index' do
    it 'loads all the posts and sorts them by created_at in desc order' do
      first, second = Fabricate(:post), Fabricate(:post)  
      
      get :index

      expect(assigns(:posts)).to eq([second, first])
    end
  end

  describe 'GET #show' do
    it 'loads post' do
      get :show, id: post.id

      expect(assigns(:post)).to eq(post)
    end
  end
end
