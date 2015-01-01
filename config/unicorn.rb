# Set the working application directory
PATH_TO_APP = "/home/datarockets/apps/datarockets.com/current"

working_directory PATH_TO_APP

# Unicorn PID file location
pid "#{PATH_TO_APP}/tmp/pids/unicorn.pid"

# Path to logs
stderr_path "#{PATH_TO_APP}/log/unicorn.log"
stdout_path "#{PATH_TO_APP}/log/unicorn.log"

# Unicorn socket
listen "#{PATH_TO_APP}/tmp/sockets/unicorn.datarockets.sock"

# Number of processes
worker_processes 3

# Time-out
timeout 30
