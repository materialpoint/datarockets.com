require 'capistrano-db-tasks'

lock '3.3.5'

set :rbenv_type, :user
set :rbenv_ruby, '2.1.2'

set :application, 'datarockets.com'
set :deploy_to, '/home/datarockets/apps/datarockets.com/'
set :deploy_via, :remote_cache
set :use_sudo, :true

set :scm, 'git'
set :repo_url, 'git@github.com:datarockets/datarockets.com.git'
set :branch, 'v2'

set :format, :pretty
set :log_level, :info
set :pty, true

set :linked_files, %w{config/database.yml config/secrets.yml config/app_config.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :keep_releases, 5

set :unicorn_config_path, 'config/unicorn.rb'
set :unicorn_rack_env, 'production'

after 'deploy', 'deploy:cleanup'
after 'deploy:publishing', 'unicorn:reload'
