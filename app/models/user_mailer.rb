class UserMailer < ActionMailer::Base
  def password_reset_instructions(user)
    recipients      user.email
    from            "do-not-reply@footballops.org"
    subject         "FootballOps Password Reset Instructions"
    sent_on         Time.now
    body            :user => user
    content_type    "text/html"
  end
end
