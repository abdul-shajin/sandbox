class SubscriptionMailer < ActionMailer::Base
  default from: "beta@supportsages.com"


  def last_day_notification_for_month subscription
    @subscription = subscription
    mail(:to => @subscription.email, :subject => 'Reminder : Last day to renew our service')
  end

  def test_mail
    mail(:to => 'shajinvk@gmail.com',:subject => 'This is a test from spree app')
  end

  def pre_week_notification_for_month_subscriber subscription
    @subscription = subscription
    mail(:to => @subscription.email, :subject => 'Reminder : Your next renew date is 7 days ahead')
  end

  def pre_day_notification_for_month subscription
    @subscription = subscription
    mail(:to => @subscription.email, :subject => 'Reminder : Your next renew date if tomorrow')
  end

end
