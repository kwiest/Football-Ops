module Api
  module V1
    class UsersController < ::ApiController

      def index
        @users = User.all
        render json: @users
      end

      def show
        @user = User.find params[:id]
        render json: @user
      end

      def create
        if can? :create, User
          @user = User.create params[:user]
          if @user.save
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          head :unauthorized
        end
      end

      def update
        if can? :update, User
          @user = User.find params[:id]
          @user.update_attributes params[:user]
          if @user.save
            render json: @user
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        else
          head :unauthorized
        end
      end

      def destroy
        if can? :delete, User
          @user = User.find params[:id]
          @user.destroy
          head :no_content
        else
          head :unauthorized
        end
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
