# frozen_string_literal: true

require 'test_helper'

class AuthorizeApiRequestTest < ActiveSupport::TestCase
  setup do
    @user = users(:dhul)
    @header = { 'Authorization' => auth_token_generator(@user.id) }
  end

  test 'it returns correct user when request is valid' do
    command = AuthorizeApiRequest.new(@header).call
    user = command.result

    assert user, @user.id
  end

  test 'it returns nil user when no token is passed to request' do
    command = AuthorizeApiRequest.new(invalid_headers).call

    assert_nil command.result
  end

  test 'it returns nil user when invalid token is passed to request' do
    command = AuthorizeApiRequest.new({ 'Authorization' => auth_token_generator('random') }).call

    assert_nil command.result
  end

  test 'it returns nil user when fake token is passed to request' do
    command = AuthorizeApiRequest.new({ 'Authorization' => 'fake' }).call

    assert_nil command.result
  end
end
