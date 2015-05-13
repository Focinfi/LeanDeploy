#!/usr/bin/env puma

environment ENV['RAILS_ENV'] || 'production'

#daemonize true

pidfile "/home/deploy/project/LearnDeploy/tmp/pids/puma.pid"
stdout_redirect "/home/deploy/project/LearnDeploy/tmp/log/stdout", "/home/deploy/project/LearnDeploy/tmp/log/stderr"

threads 0, 16

bind "unix:///tmp/puma.sock"

activate_control_app
