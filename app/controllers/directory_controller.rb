class DirectoryController < ApplicationController
  before_filter :ensure_authenticated

  def index
    gon.access_token = current_user_access_token
  end


  private

  def current_user_access_token
    app = App.find_by_name! 'FootballOps.org Official Website'
    AccessToken.where(app_id: app, user_id: current_user).first.token
  rescue ActiveRecord::RecordNotFound
    Rails.logger.error "Cannot find Website AccessToken for #{current_user.full_name}"
  end
end
