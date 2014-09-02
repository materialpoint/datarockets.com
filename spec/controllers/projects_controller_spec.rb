require 'rails_helper'

describe ProjectsController, type: :controller do
  let(:project) { Fabricate(:project) }

  describe 'GET #index' do
    it 'loads all the projects and sorts them by created_at in desc order' do
      first, second = Fabricate(:project), Fabricate(:project)

      get :index

      expect(assigns(:projects)).to eq([second, first])
    end
  end

  describe 'GET #show' do
    it 'loads project' do
      get :show, id: project.id

      expect(assigns(:project)).to eq(project)
    end
  end
end
