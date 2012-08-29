module Api
  module V1
    class ConferencesController < ::ApiController
      load_and_authorize_resource

      def index
        page  = params.fetch :page, 1
        limit = params.fetch :limit, 25

        @conferences = Conference.page(page).per(limit)
        render json: @conferences, root: false
      end

      def show
        @conference = Conference.find params[:id]
        render json: @conference, root: false
      end

    end
  end
end
