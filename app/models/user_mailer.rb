class UserMailer < MadMimiMailer
  def mimi_password_reset_instructions(user)
    use_erb     true
    subject     "FootballOps Password Reset Instructions"
    from        "do-not-reply@footballops.org"
    body        :user => user
  end
end