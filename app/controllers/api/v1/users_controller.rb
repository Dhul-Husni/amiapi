# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApiController
      skip_before_action :authenticate_request!, only: :create

      def create
        user = User.create!(user_params)

        inviter = User.find_by(referral_code: params[:referral_code]) if params[:referral_code].present?
        inviter.refer(user) if inviter.present?

        render json: user, serializer: Api::V1::UserSerializer, status: :created
      end

      private

      def user_params
        params.permit(:username, :email, :password)
      end
    end
  end
end
