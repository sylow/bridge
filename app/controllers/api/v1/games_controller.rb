module Api
  module V1
    class GamesController < ApiController
      def create
        run Game::Create, {params: {user: users[0], north:users[0], south: users[1], west: users[2], east: users[3]}}
        render json: @model, include: 'deal,deal.hands,north,south,east,west'
      end

      def users
        User.all
      end
    end
  end
end