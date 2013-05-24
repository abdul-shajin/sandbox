require 'subscription_mailer'

module Spree
  module  Subscriptions
    module Notifications

      def state_check
        subscriptions = Spree::Subscription.where(:state => 'active').where('`date(expiry_date)` = ?',Date.today)
        subscriptions.each do |sub|
          sub.update_attribute(:state,'finished')
          SubscriptionMailer.delay(:queue => 'mail_queue').expiry_date_notification(sub)
        end
      end
      #Method to run in rake task
      def all_notification
        pre_week_notification_for_month
        pre_day_notification_for_month
        last_day_notification
      end

      #Notify week before last date - month
      #Make the mail template
      def pre_week_notification_for_month
        notify_date  = 7.days.from_now.to_date
        subscriptions = subscribers_puller notify_date
        subscriptions.each do |subscription|
          SubscriptionMailer.delay(:queue => 'mail_queue').pre_week_notification_for_month_subscriber(subscription)
        end
      end

      #Notify Day b4 last date
      def pre_day_notification_for_month
        notify_date = Date.tomorrow
        subscriptions = subscribers_puller notify_date
        subscriptions.each do |subscription|
          SubscriptionMailer.delay(:queue => 'mail_queue').pre_day_notification_for_month(subscription)
        end
      end

      #Notify last date
      def last_day_notification
        notify_date = Date.today
        subscriptions = subscribers_puller notify_date
        p subscriptions.inspect
        subscriptions.each do |subscription|
          SubscriptionMailer.delay(:queue => 'mail_queue').last_day_notification_for_month(subscription)
        end
      end

    private
      def subscribers_puller date
        Spree::Subscription.includes(:issues).where("`state` = ?",'active').where('date(spree_issues.remind_at) = :next_week',{:next_week => date})
      end
    end
  end
end
