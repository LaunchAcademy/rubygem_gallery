class MemberMailer < ActionMailer::Base
  default from: "from@example.com"

  #An email is sent to the owner of an item when a new review is posted about it.
  def review_notification
    @greeting = 'Hi'

    mail(to: 'user@example.com', subject: 'New Review')
  end

end
