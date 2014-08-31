Dir[Rails.root.join("spec/support/{helpers,controllers}/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Helpers::OmniauthHelper
  config.include Helpers::SessionsHelper, type: :controller
  config.extend Helpers::RolesHelper, type: :controller
  config.extend Helpers::ErrorsHelper, type: :controller
end
