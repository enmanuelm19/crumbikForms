class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_client.subject
  #
  def new_client(user)
    @content = "Probando el mailer de rails"
    @user = user.email


    mail to: @user
  end
end
