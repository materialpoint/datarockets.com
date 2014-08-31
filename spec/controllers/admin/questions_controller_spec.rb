require 'rails_helper'

describe Admin::QuestionsController, type: :controller do
  let(:question) { Fabricate(:question) }

  describe 'GET #index' do
    for_user :admin do
      it 'loads all the questions and sorts them by created_at in desc order' do
        first, second = Fabricate(:question), Fabricate(:question)

        get :index

        expect(assigns(:questions)).to eq([second, first])
      end
    end
  end

  describe 'GET #new' do
    it_requires_authentication do
      get :new
    end

    for_user :admin do
      it 'loads new question' do
        get :new

        expect(assigns(:question)).to be_a_new(Question)
      end
    end
  end

  describe 'POST #create' do
    it_requires_authentication do
      post :create, question: Fabricate.attributes_for(:question).slice(:title, :answer)
    end

    for_user :admin do
      it 'creates questions with valid params' do
        post :create, question: Fabricate.attributes_for(:question).slice(:title, :answer)

        expect(assigns(:question)).to be_persisted
      end

      it 'does not create question with invalid params' do
        post :create, question: { title: nil, answer: nil }

        expect(assigns(:question)).not_to be_persisted
      end
    end
  end

  describe 'GET #edit' do
    it_requires_authentication do
      get :edit, id: question.id
    end

    for_user :admin do
      it 'loads the requested question' do
        get :edit, id: question.id

        expect(assigns(:question)).to be_persisted
      end
    end
  end

  describe 'PUT/PATCH #update' do
    it_requires_authentication do
      patch :update, id: question.id, question: { title: 'updated name' }
    end

    for_user :admin do
      it 'loads the requested question' do
        patch :update, id: question.id, question: { title: 'updated name' }

        expect(assigns(:question)).to eq(question)
      end

      it 'update question with valid params' do
        patch :update, id: question.id, question: { title: 'updated name' }

        expect(question.reload.title).to eq('updated name')
      end

      it 'does not update question with invalid params' do
        patch :update, id: question.id, question: { name: nil }

        expect(question.reload.title).not_to eq(nil)
      end
    end
  end

  describe 'DELETE #destroy' do
    it_requires_authentication do
      delete :destroy, id: question.id
    end

    for_user :admin do
      it 'deletes project' do
        delete :destroy, id: question.id

        expect(assigns(:question)).not_to be_persisted
      end
    end
  end
end
