# vim ft=ruby

# test at spec/rake/base_spec.rb

require "./lib/base"

require 'colored'
require 'yaml'

load "./lib/rake/dev.rake"
load "./lib/rake/site.rake"
load "./lib/rake/data.rake"
load "./lib/rake/cron.rake"

require "./lib/rake/loggers"

# ----- utility methods -----

include Rake::Loggers

log "Environment: #{MM_ENV}"

# ----- fini -----