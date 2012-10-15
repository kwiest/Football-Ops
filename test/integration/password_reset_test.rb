require 'test_helper'

class PasswordResetTest < ActionDispatch::IntegrationTest
  def setup
    @user = users :kyle
  end

  def test_trying_to_reset_password_while_signed_in
    @user.password = 'secret'
    sign_in @user
    visit new_password_reset_path
    assert_equal directory_path, current_path, 'Should be on the directory page'
    assert has_content?('You have to sign-out before you can access this page.')
    reset_session!
  end

  def test_sending_password_recovery_email
    visit new_password_reset_path
    fill_in 'Email address', with: @user.email
    click_button 'Reset my password'

    assert_equal 1, UserMailer.deliveries.size, 'Should have 1 mail ready to be sent'
    assert_equal [@user.email], UserMailer.deliveries[0].to, 'Email should be to @user'
    assert_equal root_path, current_path, 'Should be on the home page'
  end

  def test_setting_new_password
    new_password = 'a new secret'
    @user.reset_perishable_token!

    User.any_instance.expects(:password=).with(new_password)
    User.any_instance.expects(:password_confirmation=).with(new_password)

    visit "password_resets/#{@user.perishable_token}/edit"
    fill_in 'Password', with: new_password
    fill_in 'Password confirmation', with: new_password
    click_button 'Change my password'

    assert_equal directory_path, current_path, 'Should be redirected to directory page'
  end
end
