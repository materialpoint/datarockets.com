Dir[Rails.root.join("spec/support/{helpers,controllers}/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Helpers::OmniauthHelper
  config.include Helpers::SessionsHelper, type: :controller
  config.extend Controllers::RolesHelper, type: :controller
  config.extend Controllers::ErrorsHelper, type: :controller
end
