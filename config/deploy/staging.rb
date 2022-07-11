set :user, "ubuntu"
server "15.188.115.192", user: "#{fetch(:user)}", roles: %w{app db web}
set :keep_releases, 1

set :deploy_to, "/home/#{fetch(:user)}/projects/#{fetch(:application)}/#{fetch(:stage)}"
set :puma_conf, "/home/#{fetch(:user)}/projects/#{fetch(:application)}/#{fetch(:stage)}/shared/config/puma.rb"

set :pg_without_sudo, false
set :pg_database, Rails.application.credentials.staging[:db_name]
set :pg_username, Rails.application.credentials.staging[:db_user]
set :pg_password, Rails.application.credentials.staging[:db_password]
set :pg_extensions, ["citext", "hstore"]
set :pg_encoding, "UTF-8"
set :pg_pool, "100"

set :nginx_server_name, "staging.#{fetch(:application)}.blue-planet.be"
