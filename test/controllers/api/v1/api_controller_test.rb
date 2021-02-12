# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class ApiControllerTest < ActionController::TestCase
      test 'status' do
        get :status
        assert_response :success
      end
    end
  end
end
