module Api
  module V1
    class UsersController < ApiController
      def show
        user = User.find_by name: params[:id]
        render json: user
      end

      def create
      end
    end
  end
end