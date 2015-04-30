#!/usr/bin/env puma

environment ENV['RAILS_ENV'] || 'production'

daemonize true

pidfile "/var/www/Dumi/shared/tmp/pids/puma.pid"
stdout_redirect "/var/www/Dumi/shared/tmp/log/stdout", "/var/www/Dumi/shared/tmp/log/stderr"

threads 0, 16

bind "unix:///var/www/Dumi/shared/tmp/sockets/puma.sock"