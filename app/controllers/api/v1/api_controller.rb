# frozen_string_literal: true

module Api
  module V1
    class ApiController < ActionController::API
      include Api::Concerns::JwtAuthenticatable
      before_action :authenticate_request!, except: :status

      rescue_from ActiveRecord::RecordNotFound,        with: :render_not_found
      rescue_from ActiveRecord::RecordInvalid,         with: :render_record_invalid
      rescue_from ActionController::ParameterMissing,  with: :render_parameter_missing

      def status
        render json: { online: true }
      end

      private

      def render_not_found(exception)
        Rails.logger.info { exception }
        render json: { error: I18n.t('api.errors.not_found') }, status: :not_found
      end

      def render_record_invalid(exception)
        Rails.logger.info { exception }
        render json: { errors: exception.record.errors.as_json }, status: :bad_request
      end

      def render_parameter_missing(exception)
        Rails.logger.info { exception }
        render json: { error: I18n.t('api.errors.missing_required_param') }, status: :unprocessable_entity
      end
    end
  end
end
