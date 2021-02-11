# frozen_string_literal: true

require 'test_helper'

class AuthenticateUserTest < ActiveSupport::TestCase
  test 'it returns token when valid credentials' do
    user = users(:dhul)
    authentication = AuthenticateUser.new(user.email, 'dhul_password').call
    assert authentication.successful?

    api_authorization = AuthorizeApiRequest.new({ 'Authorization' => authentication.result }).call
    assert api_authorization.result, user
  end

  test 'it returns error when invalid credentials' do
    user = users(:dhul)
    authentication = AuthenticateUser.new(user.email, 'invalid_password').call
    assert_not authentication.successful?

    api_authorization = AuthorizeApiRequest.new({ 'Authorization' => authentication.result }).call
    assert_not api_authorization.result, user
  end
end
