require 'rails_helper'

RSpec.shared_examples 'public resource controller' do
  include Helpers::ModelNameControllerHelper

  describe 'GET #index' do
    it 'loads all the instances and sorts them by created_ad in desc order' do
      first, second = Fabricate(element_name), Fabricate(element_name)

      get :index

      expect(assigns(collection_name)).to eq([second, first])
    end
  end

  describe 'GET #show' do
    it 'loads the instance' do
      instance = Fabricate(element_name)

      get :show, id: instance.id

      expect(assigns(element_name)).to eq(instance)
    end
  end
end
