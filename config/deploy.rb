require 'bundler/capistrano'

default_run_options[:pty] = true

set :application, "wbe-shop"

set :scm, :git
set :repository,  "git@github.com:gbish/wbe-shop.git"
set :scm_passphrase, ""

set :shell, '/bin/bash'
default_environment["PATH"] = "/data/opt/node/bin:/data/opt/ruby/bin/:/usr/local/bin:/bin:/usr/bin:$PATH"

set :user, "web"

set :use_sudo, false

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
  
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end

