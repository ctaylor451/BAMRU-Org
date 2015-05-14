require_relative "../base"

namespace :cron do
  desc "Initialize cron process"
  task :init do
    log "cron:init"
    system "whenever -f cron.rb --update-crontab"
  end

  desc "Remove cron process"
  task :remove do
    log "cron:remove"
    system "whenever -f cron.rb --clear-crontab"
  end

  desc "Show cron status"
  task :status do
    log "cron:status"
    system "crontab -l"
  end
end

