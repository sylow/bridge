module Api
  module V1
    class HandsController < ApiController
      def show
        run Deal::Find, {id: params[:id]}
        render json: @model
      end
    end
  end
end