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
        params['api/v1/user'].delete 'url'
        params['api/v1/user'].delete 'conference_id'
        params['api/v1/user'].delete 'conference_name'
        params['api/v1/user'].delete 'district_id'
        params['api/v1/user'].delete 'district_name'
        params['api/v1/user'].delete 'division_id'
        params['api/v1/user'].delete 'division_name'
        params['api/v1/user'].delete 'school_name'

        unless can? :manage, User
          Rails.logger.info "Unpermitted user #{current_user.id} attempted to change protected attrs"
          params['api/v1/user'].delete :admin
          params['api/v1/user'].delete :conference_rep
          params['api/v1/user'].delete :national_committee
        end
        params['api/v1/user']
      end
    end
  end
end
