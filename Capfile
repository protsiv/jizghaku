require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/rbenv'
set :rbenv_type, :deploy
set :rbenv_ruby, File.read('.ruby-version').strip

require 'capistrano/nginx'
require 'capistrano/rails'
require 'capistrano/rails/db'
require 'capistrano/upload-config'
require 'capistrano/rails/migrations'
require 'sshkit/sudo'

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
