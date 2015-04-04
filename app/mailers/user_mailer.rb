class UserMailer < ApplicationMailer

  def signup_confirmation(user)
    @user = user

    mail to: user.email,
    subject: "Park Friends | Thank you for signing up!",
    reply_to: "hello@parkfriends.com"
  end
end
