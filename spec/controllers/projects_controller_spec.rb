require 'rails_helper'

describe ProjectsController do
  describe 'GET #index' do
    it 'loads all the projects and sorts them by order' do
      first, second, third = Fabricate(:project, order: 3),
        Fabricate(:project, order: 1), Fabricate(:project, order: 2)

      get :index

      expect(assigns(:projects)).to eq([second, third, first])
    end
  end

  describe 'GET #show' do
    it 'loads the project' do
      project = Fabricate(:project)

      get :show, id: project.id

      expect(assigns(:project)).to eq(project)
    end
  end
end
