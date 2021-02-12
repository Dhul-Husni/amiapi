# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionController::TestCase
      test 'it creates a new user without referral (not rewarded)' do
        post :create, params: { username: 'cat', email: 'cat@gmail.com', password: 'cat_password' }
        assert_response :success

        new_user = User.find_by(email: 'cat@gmail.com')
        assert_equal new_user.total_rewarded_amount, 0
        assert_nil new_user.inviter
      end

      test 'it creates a new user with referral and rewards them' do
        inviter = users(:dhul)

        post :create, params: {
          username: 'cat', email: 'cat@gmail.com', password: 'cat_password', referral_code: inviter.referral_code
        }
        assert_response :success

        new_user = User.find_by(email: 'cat@gmail.com')
        assert_equal new_user.total_rewarded_amount, 10
        assert_equal inviter, new_user.inviter
      end

      test 'it does not register already existing users' do
        inviter = users(:dhul)

        post :create, params: {
          username: 'cat', email: inviter.email, password: 'cat_password'
        }
        assert_response :bad_request

        new_user = User.find_by(email: 'cat@gmail.com')
        assert_nil new_user
      end

      test '#show' do
        user = users(:dhul)
        auth_token = auth_token_generator(users(:dan).id)

        @request.headers['Authorization'] = "Bearer #{auth_token}"
        get :show, params: { id: user.id }

        assert_response :success
        json_response = JSON.parse(response.body).with_indifferent_access
        assert_equal json_response[:id], user.id
      end
    end
  end
end
