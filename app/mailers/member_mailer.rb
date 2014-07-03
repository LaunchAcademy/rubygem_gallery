class MemberMailer < ActionMailer::Base
  default from: 'no-reply@example.com',
          return_path: 'system@example.com'

  def review_notification(ruby_gem)
    @ruby_gem = ruby_gem
    mail(to: @ruby_gem.user.email, subject: 'New Review')
  end
end
