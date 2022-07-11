require File.expand_path('./environment', __dir__)

set :application, 'slow'
set :repo_url, 'git@github.com:pinchett-i/slow.git'
set :branch, ENV['BRANCH'] if ENV['BRANCH']

set :rbenv_type, :user
set :rbenv_ruby, '3.1.2'

set :rbenv_map_bins, %w[rake gem bundle ruby rails puma pumactl bundler]
set :rbenv_roles, :all

set :linked_files, %w[config/master.key config/database.yml]
set :linked_dirs, %w[tmp/pids tmp/sockets log]



before 'deploy:assets:precompile', 'deploy:yarn_install'
namespace :deploy do
  desc 'Run rake yarn:install'
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install")
      end
    end
  end
end
