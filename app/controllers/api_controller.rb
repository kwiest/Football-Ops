class ApiController < ApplicationController
  def current_user
    nil
  end

  def can?(action, model)
    false
  end
end
