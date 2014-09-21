require 'rails_helper'

describe Admin::ProjectsController do
  it_behaves_like 'admin resource controller'

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
end
