module Spree
  module Subscription
    module Notifications
      #Method to run in rake task
      def all_notification
        p __method__;p '&'*70
      end
      #Notify week before last date - month
      #Make the mail template
      def week_notification_for_month_sub
        subscriptions  = Spree::Subscription.includes(:issues).where("`state` = ? and `interval` = ?",true,'Month').where('date(spree_issues.remind_at) = :next_week',{:next_week => 7.days.from_now.to_date})
        subscriptions.each do |subscription|
          SubscriptionMailer.week_notification_for_month_sub_mailer(subscription).deliver
        end
      end
      #Notify Day b4 last date
      def day_before_notification
        p __method__;p '&'*70
      end
      #Notify last date
      def today_notification
        p __method__;p '&'*70
      end
    end
  end
end
