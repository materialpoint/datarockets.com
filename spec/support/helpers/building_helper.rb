module Helpers
  module BuildingHelper
    def it_builds_for(instance, instance_to_build, &block)
      it "builds a #{instance_to_build.to_s} for #{instance.to_s}" do
        instance_exec(&block)

        expect(assigns(instance).send(instance_to_build)).
          to be_a_new(instance_to_build.to_s.classify.constantize)
      end
    end
  end
end
