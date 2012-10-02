module IntegrationHelpers
  def sign_in(user)
    visit '/sign_in'
    fill_in 'user_session_email',    with: user.email
    fill_in 'user_session_password', with: user.password
    click_button 'Sign in'
  end
end
