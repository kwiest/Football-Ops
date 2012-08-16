module Api
  module V1
    class UsersController < ::ApiController
      load_and_authorize_resource

      def index
        @users = User.all
        render json: @users, root: false
      end

      def show
        @user = User.find params[:id]
        render json: @user, root: false
      end

      def create
        @user = User.create clean_params
        if @user.save
          render json: @user, root: false
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        @user = User.find params[:id]
        @user.update_attributes clean_params
        if @user.save
          render json: @user, root: false
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
        render json: @users.to_a, root: false
      end

      def conference_reps
        @users = User.where conference_rep: true
        render json: @users.to_a, root: false
      end

      def national_committee
        @users = User.where national_committee: true
        render json: @users.to_a, root: false
      end


      private

      def clean_params
        unless can? :manage, User
          params[:user].delete :admin
          params[:user].delete :conference_rep
          params[:user].delete :national_committee
        end
        params[:user]
      end
    end
  end
end
