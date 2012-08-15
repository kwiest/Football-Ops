class DeveloperController < ApplicationController

  def users
    @user = UserSerializer.new(User.find 105).serializable_hash
    @hawk = UserSerializer.new(User.find 104).serializable_hash
  end

end
