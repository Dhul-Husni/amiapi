# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApiController
      skip_before_action :authenticate_request!

      def login
        command = AuthenticateUser.call(user_params[:email], user_params[:password])

        if command.successful?
          render(json: { auth_token: command.result })
        else
          render(json: { errors: command.errors.full_messages }, status: :unauthorized)
        end
      end

      private

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end
