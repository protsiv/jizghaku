lock "3.7.2"
server '185.69.53.152', user: 'deploy', roles: %w{app db web}, primary: true

set :pty, true
set :user, 'deploy'
set :stage, :production
set :application, "jizhaku"
set :rails_env, 'production'
set :conditionally_migrate, true
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :repo_url, "git@github.com:protsiv/jizghaku.git"

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/assets')

set :config_example_suffix, '.example'
set :config_files, %w{config/database.yml config/secrets.yml}
set :puma_conf, "#{shared_path}/config/puma.rb"

namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  #before 'deploy:migrate', 'deploy:db:create'
  after 'puma:smart_restart', 'nginx:restart'
end
