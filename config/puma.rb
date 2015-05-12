#!/usr/bin/env puma

environment ENV['RAILS_ENV'] || 'production'

daemonize true

pidfile "/var/www/dumi/shared/tmp/pids/puma.pid"
stdout_redirect "/var/www/dumi/shared/tmp/log/stdout", "/var/www/dumi/shared/tmp/log/stderr"

threads 0, 16

bind "unix:///var/www/dumi/shared/tmp/sockets/puma.sock" 
 
activate_control_app