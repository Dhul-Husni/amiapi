# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class AuthenticationControllerTest < ActionController::TestCase
      test 'it authenticates valid credentials' do
        user = users(:dhul)

        post :login, params: { email: user.email, password: 'dhul_password' }
        assert_response :success

        auth_token = JSON.parse(response.body)[:auth_token]
        command = AuthorizeApiRequest.new(valid_headers(token: auth_token)).call
        assert command.successful?
        assert user, command.result
      end

      test 'it does not authenticate a invalid credentials' do
        user = users(:dhul)

        post :login, params: { email: user.email, password: 'invalid_password' }
        assert_response :unauthorized
      end
    end
  end
end
