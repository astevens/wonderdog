#!/usr/bin/env puma
pidfile 'tmp/pids/puma.pid'
state_path 'tmp/pids/puma.state'

threads 0, 16

bind 'tcp://0.0.0.0:9292'
bind 'unix://tmp/sockets/puma.sock?umask=0777'

# Command to use to restart puma. This should be just how to
# load puma itself (ie. 'ruby -Ilib bin/puma'), not the arguments
# to puma, as those are the same as the original process.
#
# restart_command '/u/app/lolcat/bin/restart_puma'

# workers 2

# on_worker_boot do
#   puts 'On worker boot...'
# end

# after_worker_boot do
#   puts 'On worker boot...'
# end

# prune_bundler
# preload_app!
# worker_timeout 60

# tag 'app name'

# activate_control_app 'unix://tmp/sockets/pumactl.sock'
