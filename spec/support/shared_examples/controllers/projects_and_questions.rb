require 'rails_helper'

RSpec.shared_examples 'a controller' do
  let(:instance) { Fabricate(model_name) }  

  describe 'GET #index' do
    it 'loads all the instances and sorts them by created_ad in desc order' do
      first, second = Fabricate(model_name), Fabricate(model_name)

      get :index

      expect(assigns(pluralized_model_name)).to eq([second, first])
    end
  end

  describe 'GET #show' do
    it 'loads the instance' do
      get :show, id: instance.id

      expect(assigns(model_name)).to eq(instance)
    end
  end
end
