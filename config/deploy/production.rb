set :pg_database, Rails.application.credentials.production[:db_name]
set :pg_username, Rails.application.credentials.production[:db_user]
set :pg_password, Rails.application.credentials.production[:db_password]
