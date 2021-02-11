# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApiController
      skip_before_action :authenticate_user!

      def login
        command = AuthenticateUser.call(user_params[:email], user_params[:password])

        if command.successful?
          render(json: { auth_token: command.result })
        else
          render(json: { error: command.errors }, status: :unauthorized)
        end
      end

      private

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
