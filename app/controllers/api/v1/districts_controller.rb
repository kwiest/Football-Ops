module Api
  module V1
    class DistrictsController < ::ApiController
      load_and_authorize_resource

      def index
        @districts = District.all
        render json: @districts, root: false
      end

      def show
        @district = District.find params[:id]
        render json: @district, root: false
      end

    end
  end
end

