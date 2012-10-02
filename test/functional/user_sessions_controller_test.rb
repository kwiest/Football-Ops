require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def setup
    @kyle = users :kyle
  end

  def test_create
    post :create, user_session: { email: 'kwiest@uoregon.edu', password: 'secret' }
    assert user_session = UserSession.find
    assert_equal @kyle, user_session.record, 'Current user should be "Kyle"'
    assert_redirected_to directory_path
  end

  def test_create_with_redirect_path
    session['redirect_after_sign_in'] = developer_path
    post :create, user_session: { email: 'kwiest@uoregon.edu', password: 'secret' }
    assert user_session = UserSession.find
    assert_equal @kyle, user_session.record, 'Current user should be "Kyle"'
    assert_redirected_to developer_path
    assert_nil session['redirect_after_sign_in']
  end

  def test_destroy
    # Sign-in first
    post :create, user_session: { email: 'kwiest@uoregon.edu', password: 'secret' }

    delete :destroy
    assert_nil UserSession.find
    assert_equal flash[:notice], 'Successfully signed-out. Come back soon.'
    assert_redirected_to root_path
  end

  def test_destroy_without_being_signed_in
    delete :destroy
    assert_nil UserSession.find
    assert_equal flash[:notice], 'Successfully signed-out. Come back soon.'
    assert_redirected_to root_path
  end
end
