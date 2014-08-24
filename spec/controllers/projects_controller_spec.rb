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
    it 'loads the requested project' do
      get :show, id: project.id

      expect(assigns(:project)).to eq(project)
    end
  end

  describe 'GET #new' do
    it 'loads new project' do
      get :new

      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe 'POST #create' do
    it 'creates project with valid params' do
      post :create, project: Fabricate.attributes_for(:project).slice(:name, :description)

      expect(assigns(:project)).to be_persisted
    end

    it 'does not create project with invalid params' do
      post :create, project: { name: nil, description: nil }

      expect(assigns(:project)).not_to be_persisted
    end
  end

  describe 'GET #edit' do
    it 'loads the requested project' do
      get :edit, id: project.id

      expect(assigns(:project)).to be_persisted
    end
  end

  describe 'PUT/PATCH #update' do
    it 'loads the requested project' do
      patch :update, id: project.id, project: { name: 'updated name' }

      expect(assigns(:project)).to eq(project)
    end

    it 'update project with valid params' do
      patch :update, id: project.id, project: { name: 'updated name' }

      expect(project.reload.name).to eq('updated name')
    end

    it 'does not update project with invalid params' do
      patch :update, id: project.id, project: { name: nil }

      expect(project.reload.name).not_to eq(nil)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes project' do
      delete :destroy, id: project.id

      expect(assigns(:project)).not_to be_persisted
    end
  end
end
