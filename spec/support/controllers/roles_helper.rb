module Controllers
  module RolesHelper
    def for_users(*roles, &block)
      roles.each do |role|
        context "for #{role}" do
          let(:user) { Fabricate(:user, role: role) }

          before :each do
            sign_in(user)
          end

          instance_exec(&block)
        end
      end
    end

    alias :for_user :for_users
  end
end
