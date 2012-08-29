module Api
  module V1
    class DivisionsController < ::ApiController
      load_and_authorize_resource

      def index
        @divisions = Division.all
        render json: @divisions, root: false
      end

      def show
        @division = Division.find params[:id]
        render json: @division, root: false
      end

    end
  end
end


