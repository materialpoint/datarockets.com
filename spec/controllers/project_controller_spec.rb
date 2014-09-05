require 'rails_helper'

describe ProjectsController, type: :controller do
  let(:question) { Fabricate(:project) }

  describe 'GET #index' do
    it 'loads all the questions and sorts them by created_at in desc order' do
      first, second = Fabricate(:project), Fabricate(:project)

      get :index

      expect(assigns(:projects)).to eq([second, first])
    end
  end

  describe 'GET #show' do
    it 'loads question' do
      get :show, id: question.id

      expect(assigns(:project)).to eq(question)
    end
  end
end
