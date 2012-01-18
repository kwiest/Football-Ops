class UserMailer < ActionMailer::Base
  default from: "do-not-reply@footballops.org"

  def password_reset_instructions(user)
    @user = user
    mail(
      to:           user.email,
      subject:      "FootballOps Password Reset Instructions",
      content_type: "text/html",
      tag:          "footballops-password-reset"
    )
  end
end
