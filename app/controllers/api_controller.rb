class ApiController < ApplicationController
  before_filter :ensure_authenticated


  private

  def ensure_authenticated
    head :unauthorized unless signed_in?
  end
end
