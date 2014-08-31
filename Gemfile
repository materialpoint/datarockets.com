source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.5'
gem 'pg'
gem 'uglifier', '~> 2.5'
gem 'sass-rails', '~> 4.0.3'
gem 'slim-rails', '~> 2.0'
gem 'jquery-rails', '~> 2.1'
gem 'responders', '~> 1.1.0'
gem 'simple_form', '~> 3.0.2'
gem 'enumerize', '~> 0.8'
# See PR for details: https://github.com/Oshuma/app_config/pull/33
gem 'app_config', github: 'datarockets/app_config', branch: 'default-config-for-base-storage'
gem 'pundit', '~> 0.3'

gem 'omniauth-google-oauth2', '~> 0.2.5'

group :development do
  gem 'listen', '~> 1.0' # spring depends on listen
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'quiet_assets'
  gem 'thin'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  gem 'capybara-webkit', '~> 1.3'
  gem 'fabrication', '~> 2.11'
  gem 'faker', '~> 1.4'
end

group :production do
  gem 'rails_12factor'
end
