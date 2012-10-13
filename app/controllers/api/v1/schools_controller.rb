module Api
  module V1
    class SchoolsController < ::ApiController
      load_and_authorize_resource

      def index
        @schools = School.all
        render json: @schools, root: false
      end

      def paginated
        page  = params.fetch :page, 1
        limit = params.fetch :limit, 25
        @schools = School.page(page).per(limit).to_a
        render json: @schools,
          each_serializer: SchoolSerializer, root: false
      end

      def show
        @school = School.find params[:id]
        render json: @school, root: false
      end

      def total_count
        @count = School.count
        render json: { count: @count }
      end

    end
  end
end
