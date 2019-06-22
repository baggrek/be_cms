workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_min_count = Integer(ENV['RAILS_MIN_THREADS'] || 1)
threads_max_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_min_count, threads_max_count

queue_requests false
worker_timeout 60

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 8090
environment ENV['RAILS_ENV'] || 'development'

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] ||
                Rails.application.config.database_configuration[Rails.env]
    ActiveRecord::Base.establish_connection(config)
  end
end

plugin :tmp_restart
