source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '4.1.5'
gem 'pg'
gem 'uglifier', '~> 2.5'
gem 'sass-rails', '~> 4.0.3'
gem 'slim-rails', '~> 2.0'
gem 'jquery-rails', '~> 2.1'

group :development do
  gem 'listen', '~> 1.0' # spring depends on listen
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'quiet_assets'
  gem 'thin'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara-webkit', '~> 1.3'
end

group :production do
  gem 'rails_12factor'
end
