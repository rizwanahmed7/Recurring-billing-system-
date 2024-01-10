# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  default from: 'rizwan.ahmed.60499@gmail.com'
  SUBJECT = 'Subscription bill'
  MSG = 'we are making your transaction related to Plan name :'

  def recurring_bill(subscription, total_bill)
    mail(
      to: subscription.user.email,
      body: "hellow #{subscription.user.name} #{MSG}
       #{subscription.plan.name}
      The amount of #{subscription.plan.monthly_fee} with over usage applicable if any #{total_bill}",
      content: 'text/html',
      subject: SUBJECT
    )
  end
end
