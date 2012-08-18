class DeveloperController < ApplicationController
  skip_before_filter :ensure_authenticated

  def users
    @kyle= UserSerializer.new(User.find 105).serializable_hash
    @hawk = UserSerializer.new(User.find 104).serializable_hash
    if signed_in?
      @user = UserSerializer.new(current_user).serializable_hash
    else
      @user = @kyle
    end
  end

end
