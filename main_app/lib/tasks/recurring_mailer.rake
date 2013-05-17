#This file is to tun daily by whenever
#Whenever gem is used to set cron jobs
# This will run daily according to the subscription mailer
#We need to run this daily
namespace :subscription do
  task :mailer => :environment do
    puts 'inside mailer task'

  end
end
