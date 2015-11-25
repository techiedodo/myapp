class RecipientMailer < ApplicationMailer
  default from: 'gaytan.app@gmail.com'

  def recipient_confirmation(recipient)
    @recipient = recipient
    @user = recipient.user

    mail(to: @recipient.email, subject: "#{@user.name} has created a trove for you.")
  end
end
