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
    it 'loads question' do
      get :show, id: question.id

      expect(assigns(:question)).to eq(question)
    end
  end
end
