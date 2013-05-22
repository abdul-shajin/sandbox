class SubscriptionMailer < ActionMailer::Base
  default from: "beta@supportsages.com"

  def test_mail
    mail(:to => 'shajinvk@gmail.com',:subject => 'This is a test from spree app')
  end

  def week_notification_for_month_sub_mailer subscription
    @subscription = subscription
    mail(:to => @subscription.email, :subject => 'Reminder : Your next renew date is 7 days ahead')
  end
end
