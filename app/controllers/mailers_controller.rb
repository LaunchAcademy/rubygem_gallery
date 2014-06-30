class MailersController < ApplicationController

  def create
    @mailer = Mailer.new
  end

end
