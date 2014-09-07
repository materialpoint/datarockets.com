require 'rails_helper'

RSpec.shared_examples 'an admin controller' do
  let(:instance) { Fabricate(model_name) }

  describe 'GET #index' do
    for_user :admin do
      it 'loads all the instances and sorts them by created_at in desc order' do
        first, second = Fabricate(model_name), Fabricate(model_name)

        get :index

        expect(assigns(pluralized_model_name)).to eq([second, first])
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

        expect(assigns(model_name)).to be_a_new(const_model_name)
      end
    end
  end

  describe 'POST #create' do
    it_requires_authentication do
      post :create, model_name => Fabricate.attributes_for(model_name)
    end

    for_user :admin do
      it 'creates instance with valid params' do
        post :create, model_name => Fabricate.attributes_for(model_name)

        expect(assigns(model_name)).to be_persisted
      end

      it 'does not create project with invalid params' do
        post :create, model_name => invalid_params

        expect(assigns(model_name)).not_to be_persisted
      end
    end
  end

  describe 'GET #edit' do
    it_requires_authentication do
      get :edit, id: instance.id
    end

    for_user :admin do
      it 'loads the requested instance' do
        get :edit, id: instance.id

        expect(assigns(model_name)).to eq(instance)
      end
    end
  end

  describe 'PUT/PATCH #update' do
    it_requires_authentication do
      patch :update, id: instance.id, model_name => params_to_update(:valid)
    end

    for_user :admin do
      it 'loads the requested instance' do
        patch :update, id: instance.id, model_name => params_to_update(:valid)

        expect(assigns(model_name)).to eq(instance)
      end

      it 'update instance with valid params' do
        patch :update, id: instance.id, model_name => params_to_update(:valid)

        expect(instance.reload.send(updated_param_name)).to eq('updated')
      end

      it 'does not update instance with invalid params' do
        patch :update, id: instance.id, model_name => params_to_update(:invalid)

        expect(instance.reload.send(updated_param_name)).not_to eq('updated')
      end
    end
  end

  describe 'DELETE #destroy' do
    it_requires_authentication do
     delete :destroy, id: instance.id
    end

    for_user :admin do
      it 'deletes instance' do
        delete :destroy, id: instance.id

        expect(assigns(model_name)).not_to be_persisted
      end
    end
  end
end

# returns expressions like {"id"=>nil, "name"=>nil, "description"=>nil, "created_at"=>nil, "updated_at"=>nil}
def invalid_params
  Hash[const_model_name.column_names.map {|name| [name, nil]}]
end

def updated_param_name
  const_model_name.column_names.second
end

# returns expressions like {"name"=>"updated"} or {"name"=>nil} depending on validation option
def params_to_update(validation)
  return Hash[updated_param_name, 'updated'] if validation == :valid
  return Hash[updated_param_name, nil] if validation == :invalid
end
