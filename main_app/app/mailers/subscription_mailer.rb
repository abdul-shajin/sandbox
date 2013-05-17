class SubscriptionMailer < ActionMailer::Base
  default from: "beta@supportsages.com"

  def test_mail
    mail(:to => 'shajinvk@gmail.com',:subject => 'This is a test from spree app')
  end
end
