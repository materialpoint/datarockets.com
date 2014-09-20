require 'rails_helper'

describe Admin::ProjectsController do
  it_behaves_like 'admin resource controller'

  for_user :admin do
    describe 'GET #new' do
      it 'builds a preview image' do
        get :new

        expect(assigns(:project).preview_image).to be_a_new(PreviewImage)
      end
    end

    describe 'GET #edit' do
      let(:project) { Fabricate(:project) }

      it 'builds a preview image' do
        get :edit, id: project.id

        expect(assigns(:project).preview_image).to be_a_new(PreviewImage)
      end
    end
  end
end
