set :stage, :production
set :rails_env, :production

server '188.226.196.22', roles: [:app, :web, :db], user: 'datarockets'
