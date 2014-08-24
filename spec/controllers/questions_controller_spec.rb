require 'rails_helper'

describe QuestionsController, type: :controller do
  let(:question) { Fabricate(:question) }

  describe 'GET #index' do
    it 'loads all the questions and sorts them by created_at in desc order' do
      first, second = Fabricate(:question), Fabricate(:question)

      get :index

      expect(assigns(:questions)).to eq([second, first])
    end
  end

  describe 'GET #show' do
    it 'loads the requested question' do
      get :show, id: question.id

      expect(assigns(:question)).to eq(question)
    end
  end

  describe 'GET #new' do
    it 'loads the new question' do
      get :new

      expect(assigns(:question)).to be_a_new(Question)
    end
  end

  describe 'POST #create' do
    it 'creates question with valid params' do
      post :create, question: { title: 'title', answer: 'answer' }

      expect(assigns(:question)).to be_persisted
    end

    it 'does not create question with invalid params' do
      post :create, question: { title: nil, answer: nil }

      expect(assigns(:question)).not_to be_persisted
    end
  end

  describe 'GET #edit' do
    it 'loads the requested question' do
      get :edit, id: question.id

      expect(assigns(:question)).to eq(question)
    end
  end

  describe 'PUT/PATCH #update' do
    it 'loads the requested question' do
      patch :update, id: question.id, question: { title: 'updated title' }

      expect(assigns(:question)).to eq(question)
    end

    it 'updates the question with valid params' do
      patch :update, id: question.id, question: { title: 'updated title' }

      expect(question.reload.title).to eq('updated title')
    end

    it 'does not update the question with invalid params' do
      patch :update, id: question.id, question: { title: nil }

      expect(question.reload.title).not_to eq(nil)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes question' do
      delete :destroy, id: question.id

      expect(assigns(:question)).not_to be_persisted
    end
  end
end
