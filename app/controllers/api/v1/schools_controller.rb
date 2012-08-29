module Api
  module V1
    class SchoolsController < ::ApiController
      load_and_authorize_resource

      def index
        page  = params.fetch :page, 1
        limit = params.fetch :limit, 25

        @schools = School.page(page).per(limit)
        render json: @schools, root: false
      end

      def show
        @school = School.find params[:id]
        render json: @school, root: false
      end

    end
  end
end
