server "node23xen02.otherhosting.net", :app, :web, :db, :primary => true
set :branch, "master"
set :deploy_to, "/data/webroot/wbe-shop"