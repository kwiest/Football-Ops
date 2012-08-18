module Api
  module V1
    class SchoolsController < ::ApiController
      load_and_authorize_resource

      def index
        @schools = School.all
        render json: @schools, root: false
      end

      def show
        @school = School.find params[:id]
        render json: @school, root: false
      end

    end
  end
end
