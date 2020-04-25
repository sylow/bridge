module Api
  module V1
    class AuthController < ApiController
      def login
        result = User::Login.({params: params[:auth]})
        if result.success?
          render json: {user: result[:model], access_token: result[:access_token]}
        else
          render json: {error: 'Login failure'}, status: 401
        end
      end
    end
  end
end