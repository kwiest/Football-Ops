class DeveloperController < ApplicationController
  before_filter :assign_user

  def users
  end


  private

  def assign_user
    @user = UserSerializer.new(User.find 105).serializable_hash
  end
end
