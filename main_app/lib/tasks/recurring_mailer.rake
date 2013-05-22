#This file is to tun daily by whenever
#Whenever gem is used to set cron jobs
# This will run daily according to the subscription mailer
#We need to run this daily

namespace :subscription do
  task :mailer => :environment do
    puts 'inside mailer task'
    all_notification
  end

  task :state_check => :environment do
    puts 'inside state_check'
    #state_check  in lib/state
  end
end
