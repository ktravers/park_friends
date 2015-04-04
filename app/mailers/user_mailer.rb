class UserMailer < ApplicationMailer
  # move to background tasks

  def signup_confirmation(user)
    binding.pry
    @user = user
    mail to: user.email,
    subject: "Park Friends | Thank you for signing up!",
    reply_to: "hello@parkfriends.com"
  end

  # todo : add ability to select friends to email (third argument = friends_array)
  def invitation(game, user)
    @user = user
    @game = game
    mail subject: "Invite : #{@game.description} | #{@game.date.strftime("%A, %B %e")}",
    reply_to: "#{@user.email}"
  end

end
