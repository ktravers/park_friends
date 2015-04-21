class UserMailer < ApplicationMailer
  # move to background tasks?

  # sends confirmation email to new users only
  def signup_confirmation(user)
    @user = user
    mail to: @user.email,
         subject: 'Park Friends | Thank you for signing up!',
         reply_to: 'hello.park.friends@gmail.com'
  end

  # todo - add ability to select friends to email (third argument = friends_array)
  def invitation(game, user)
    @user = user
    @game = game
    @park = Park.find(@game.park_id)
    @host = User.find(@game.host_id)
    mail subject: "Invite : #{@game.description} | #{@game.date.strftime('%A, %B %e')}",
         reply_to: "#{@user.email}",
         from: "#{@user.email}"
  end
end
