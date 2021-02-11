# frozen_string_literal: true

module Api
  module Concerns
    module JwtAuthenticatable
      class UnauthorizedError < StandardError; end

      extend ActiveSupport::Concern

      included do
        rescue_from UnauthorizedError do
          render json: { error: I18n.t('api.errors.unauthorized') }, status: :unauthorized
        end
      end

      private

      def authenticate_request!
        @current_user = AuthorizeApiRequest.call(request.headers).result
        raise(UnauthorizedError) unless @current_user
      end

      def current_user
        @current_user
      end
    end
  end
end
