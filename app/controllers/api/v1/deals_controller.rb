module Api
  module V1
    class DealsController < ApiController
      def create
        run Deal::Create, { params: {dealer: PlayerPosition::POSITIONS.sample,  zone: DealZone::ZONES.sample} }
        run Deal::Deal, { params: {deal: @model}}
        render jsonapi: @model
      end

      def show
        deal = Deal.last
        render jsonapi: deal, include: [:hands, :west]
      end
    end
  end
end