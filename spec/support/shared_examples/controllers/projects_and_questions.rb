require 'rails_helper'

RSpec.shared_examples 'public resource' do
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

  def model
    subject.controller_name.classify.constantize
  end

  def element_name
    model.model_name.element
  end

  def collection_name
    model.model_name.collection
  end
end
