require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

set :user, 'deploy'
set :domain, '42.96.137.114'
set :deploy_to, '/var/www/dumi'
set :repository, 'https://github.com/Focinfi/LeanDeploy.git'
set :branch, 'test'
set :forward_agent, true
set :app_path, lambda { "#{deploy_to}/#{current_path}" }
set :stage, 'production'
set :rvm_path, '/home/deploy/.rvm/bin/rvm'

set :shared_paths, ['log']

task :environment do
  invoke :'rvm:use[ruby-2.1.4p265@default]'
end

task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/tmp"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/tmp/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/sockets"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/pids"]

  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/tmp/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/log"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  to :before_hook do
    # Put things to run locally before ssh
  end
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    queue! "cd #{app_path} & RAILS_ENV=#{stage} bundle exec rake db:create"
    invoke :'rails:db_migrate'
    queue! "cd #{app_path} & RAILS_ENV=#{stage} bundle exec rake db:seed"
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      invoke :'puma:restart'
    end
  end
end

namespace :puma do
  desc "Start the application"
  task :start do
    queue 'echo "-----> Start Puma"'
    queue "cd #{app_path} && RAILS_ENV=#{stage} && bin/puma.sh start", :pty => false
  end

  desc "Stop the application"
  task :stop do
    queue 'echo "-----> Stop Puma"'
    queue "cd #{app_path} && RAILS_ENV=#{stage} && bin/puma.sh stop"
  end

  desc "Restart the application"
  task :restart do
    queue 'echo "-----> Restart Puma"'
    queue "cd #{app_path} && RAILS_ENV=#{stage} && bin/puma.sh restart"
  end
end

desc "Shows logs."
task :logs do
  queue %[cd #{deploy_to!}/current && tail -f log/production.log]
end

desc "Display the unicorn logs."
task :puma_logs do
  queue 'echo "Contents of the puma log file are as follows:"'
  queue "tail -f #{deploy_to}/#{shared_path}/tmp/log/stderr"
end

