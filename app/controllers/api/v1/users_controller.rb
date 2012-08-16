module Api
  module V1
    class UsersController < ::ApiController
      load_and_authorize_resource

      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.find params[:id]
        render json: @user
      end

      def create
        @user = User.create params[:user]
        if @user.save
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        @user = User.find params[:id]
        @user.update_attributes params[:user]
        if @user.save
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @user = User.find params[:id]
        @user.destroy
        head :no_content
      end

      def search
        @users = User.search params[:q]
        render json: @users.to_a
      end

      def conference_reps
        @users = User.where conference_rep: true
        render json: @users.to_a
      end

      def national_committee
        @users = User.where national_committee: true
        render json: @users.to_a
      end

    end
  end
end
