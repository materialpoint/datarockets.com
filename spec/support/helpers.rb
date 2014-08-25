Dir[Rails.root.join("spec/support/helpers/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Helpers::OmniauthHelper
  config.include Helpers::SessionsHelper, type: :controller
end
