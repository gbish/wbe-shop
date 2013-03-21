default_run_options[:pty] = true

set :application, "wbe-shop"

set :scm, :git
set :repository,  "git@github.com:gbish/wbe-shop.git"
set :scm_passphrase, ""

set :user, "web"

set :ssh_options, { :forward_agent => true }

require 'capistrano/ext/multistage'

set :stages, ["production"]
set :default_stage, "production"

set :deploy_via, :remote_cache

namespace :deploy do
  task :restart, :roles => :web do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=production"
  end
end
