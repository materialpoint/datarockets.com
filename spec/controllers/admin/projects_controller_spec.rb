require 'rails_helper'

describe Admin::ProjectsController do
  for_user :admin do
    describe 'GET #new' do
      it_builds_for(:project, :preview_image) do
        get :new
      end
    end

    describe 'GET #edit' do
      let(:project) { Fabricate(:project) }

      it_builds_for(:project, :preview_image) do
        get :edit, id: project.id
      end
    end
  end

  let(:project) { Fabricate(:project) }

  describe 'GET #index' do
    for_user :admin do
      it 'loads all the projects and sorts them by created_at in desc order' do
        first, second, third = Fabricate(:project, order: 2), Fabricate(:project, order: 3),
          Fabricate(:project, order: 1)

        get :index

        expect(assigns(:projects)).to eq([third, first, second])
      end
    end
  end

  describe 'GET #new' do
    it_requires_authentication do
      get :new
    end

    for_user :admin do
      it 'loads new project' do
        get :new

        expect(assigns(:project)).to be_a_new(Project)
      end
    end
  end

  describe 'POST #create' do
    it_requires_authentication do
      post :create, project: Fabricate.attributes_for(:project).slice(:name, :description)
    end

    for_user :admin do
      it 'creates project with valid params' do
        post :create, project: Fabricate.attributes_for(:project).slice(:name, :description)

        expect(assigns(:project)).to be_persisted
      end

      it 'does not create project with invalid params' do
        post :create, project: { name: nil}

        expect(assigns(:project)).not_to be_persisted
      end
    end
  end

  describe 'GET #edit' do
    it_requires_authentication do
      get :edit, id: project.id
    end

    for_user :admin do
      it 'loads the requested project' do
        get :edit, id: project.id

        expect(assigns(:project)).to be_persisted
      end
    end
  end

  describe 'PUT/PATCH #update' do
    it_requires_authentication do
      patch :update, id: project.id, project: { name: 'updated name' }
    end

    for_user :admin do
      it 'loads the requested user' do
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
  end

  describe 'DELETE #destroy' do
    it_requires_authentication do
      delete :destroy, id: project.id
    end

    for_user :admin do
      it 'deletes project' do
        delete :destroy, id: project.id

        expect(assigns(:project)).not_to be_persisted
      end
    end
  end
end
