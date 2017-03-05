lock '3.7.2'

server '185.69.53.152', user: 'deploy', roles: %w{app db web}, primary: true, ssh_options: {
  forward_agent: true,
  keys: [File.join(ENV['HOME'], '.ssh', 't4vps')]
}

set :pty, true
set :user, 'deploy'
set :stage, :production
set :application, 'jizhaku'
set :rails_env, 'production'
set :conditionally_migrate, true
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :repo_url, 'git@github.com:protsiv/jizghaku.git'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

set :config_files, %w{config/database.yml config/secrets.yml}

namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'deploy:migrate', 'deploy:db:create'
end
