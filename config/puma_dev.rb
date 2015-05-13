#!/usr/bin/env puma

environment ENV['RAILS_ENV'] || 'development'

#daemonize true

pidfile "/home/deploy/project/LeanDeploy/tmp/pids/puma.pid"
stdout_redirect "/home/deploy/project/LeanDeploy/tmp/log/stdout", "/home/deploy/project/LeanDeploy/tmp/log/stderr"

threads 0, 16

bind "unix:///tmp/puma.sock"

activate_control_app
