class DeveloperController < ApplicationController
  skip_before_filter :ensure_authenticated

  def index
  end

  def users
    @kyle= UserSerializer.new(User.find 105).serializable_hash
    @hawk = UserSerializer.new(User.find 104).serializable_hash
    if signed_in?
      @user = UserSerializer.new(current_user).serializable_hash
    else
      @user = @kyle
    end
  end

  def schools
    if signed_in?
      @school = SchoolSerializer.new(current_user.school).serializable_hash
    else
      # Use Oregon by default
      @school = SchoolSerializer.new(School.find 345).serializable_hash
    end
  end

end
