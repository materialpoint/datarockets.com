require 'rails_helper'

RSpec.shared_examples 'an admin controller' do
  pluralized_model_name = described_class.to_s.gsub('Admin::','').gsub('Controller','').downcase.to_sym 
  model_name = pluralized_model_name.to_s.singularize.to_sym
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

        expect(assigns(model_name)).to be_a_new(model_name.to_s.classify.constantize)
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
        post :create, model_name => invalid_params(model_name)

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
      patch :update, id: instance.id, model_name => params_to_update(model_name, :valid)
    end

    for_user :admin do
      it 'loads the requested instance' do
        patch :update, id: instance.id, model_name => params_to_update(model_name, :valid)
        
        expect(assigns(model_name)).to eq(instance)
      end

      it 'update instance with valid params' do
        patch :update, id: instance.id, model_name => params_to_update(model_name, :valid)
      
        expect(instance.reload.send(updated_param_name(model_name))).to eq('updated')
      end

      it 'does not update instance with invalid params' do
        patch :update, id: instance.id, model_name => params_to_update(model_name, :invalid)

        expect(instance.reload.send(updated_param_name(model_name))).not_to eq('updated')
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

def invalid_params(model_name)
  Hash[model_name.to_s.classify.constantize.column_names.map {|name| [name, nil]}]
end

def updated_param_name(model_name)
  model_name.to_s.classify.constantize.column_names.second
end

def params_to_update(model_name, validation)
  return Hash[model_name.to_s.classify.constantize.column_names.second, 'updated'] if validation == :valid
  return Hash[model_name.to_s.classify.constantize.column_names.second, nil] if validation == :invalid
end
