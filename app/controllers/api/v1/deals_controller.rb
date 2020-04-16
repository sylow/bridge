module Api
  module V1
    class DealsController < ApiController
      def show
        run Deal::Find, {params: params}
        render json: JSONAPI::Serializer.serialize(@model, include: %w(hands), fields: %w(hands.seat)) 
      end
    end
  end
end