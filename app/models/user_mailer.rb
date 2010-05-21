class UserMailer < MadMimiMailer
  def mimi_password_reset_instructions(user)
    use_erb     true
    subject     "FootballOps Password Reset Instructions"
    from        "do-not-reply@footballops.org"
    body        :user => user
  end

  def password_reset_instructions(user)
    recipients      user.email
    from            "do-not-reply@footballops.org"
    subject         "FootballOps Password Reset Instructions"
    sent_on         Time.now
    body            :user => user
    content_type    "text/html"
  end
end
