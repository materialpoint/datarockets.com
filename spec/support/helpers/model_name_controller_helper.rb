module Helpers
  module ModelNameControllerHelper
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
end
