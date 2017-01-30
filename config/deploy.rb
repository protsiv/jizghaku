# config valid only for current version of Capistrano
lock "3.7.2"

set :user, 'deployer'
set :application, "jizhaku"
set :rails_env, 'production'
set :repo_url, "git@github.com:protsiv/jizghaku.git"
server '185.69.53.152', user: 'deploy', roles: %w{app db web}, primary: true
set :deploy_to, "/home/deploy/jizhaku"
set :stage, :production
set :pty, true
set :conditionally_migrate, true


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/assets"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
#
set :passenger_restart_with_touch, true

namespace :deploy do
  before 'deploy:migrate', 'deploy:db:create'

  after :restart, :restart_passenger do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :touch, 'tmp/restart.txt'
      end
    end
  end

  after :finishing, 'deploy:restart_passenger'
end
