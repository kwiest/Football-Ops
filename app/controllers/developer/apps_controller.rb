module Developer
  class AppsController < ApplicationController
    before_filter :ensure_authenticated
    before_filter :assign_app, only: %w(show edit update destroy)

    def index
      @apps = current_user.apps
    end

    def show
    end

    def new
      @app = current_user.apps.new
    end

    def edit
    end

    def create
      @app = current_user.apps.create params[:app]
      if @app.save
        redirect_to developer_app_path(@app), notice: 'App successfully created.'
      else
        render action: 'new'
      end
    end

    def update
      if @app.update_attributes params[:app]
        redirect_to developer_app_path(@app), notice: 'App successfully updated.'
      else
        render action: 'edit'
      end
    end

    def destroy
      @app.destroy
      redirect_to developer_apps_path, alert: 'App destroyed.'
    end


    private

    def assign_app
      @app = current_user.apps.find params[:id]
    rescue ActiveRecord::RecordNotFound
      redirect_to developer_apps_path, alert: 'Sorry, could not find your app.'
    end

    def ensure_authenticated
      redirect_to sign_in_path, alert: 'You must be signed-in' unless signed_in?
    end
  end
end
