class UserMailer < ApplicationMailer
  default from: "17euec073@skcet.ac.in"

  def signup_confirmation(user)
    @user = user
    @greeting = "Hi"

    mail to: @user.email, subject: "Sign-up confirmation!"
  end
end
