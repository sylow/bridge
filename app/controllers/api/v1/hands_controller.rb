module Api
  module V1
    class HandsController < ApiController
      def show
        deal = run(Deal::Find, {id: params[:id]})[:model]
        render jsonapi: deal, include: [:hands, :west]
      end
    end
  end
end