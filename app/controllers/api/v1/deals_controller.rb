module Api
  module V1
    class DealsController < ApiController
      def create
        run Deal::Create, { params: {dealer: :n, zone: :all} }
        run Deal::Deal, { params: {deal: @model}}
        render json: DealsRepresenter.prepare(@model).as_json
      end
    end
  end
end