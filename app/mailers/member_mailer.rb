class MemberMailer < ActionMailer::Base
  default from: 'no-reply@example.com',
          return_path: 'system@example.com'

  #An email is sent to the owner of an item when a new review is posted about it.
  def review_notification(ruby_gem)
    @ruby_gem = ruby_gem

    mail(to: 'user@example.com', subject: 'New Review')
  end
end
