module Helpers
  module BuildingHelper
    def it_builds(new_instance, existing_instance, &block)
      it "builds a #{new_instance}" do
        instance_exec(&block)

        expect(assigns(existing_instance).send(new_instance.to_sym)).
          to be_a_new(new_instance.classify.constantize)
      end
    end
  end
end
