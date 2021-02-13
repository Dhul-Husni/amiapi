# frozen_string_literal: true

module AuthorizationHelper
  def signin(user)
    auth_token = auth_token_generator(user.id)

    @request.headers['Authorization'] = "Bearer #{auth_token}"
  end

  def auth_token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  def valid_headers(token:)
    {
      'Authorization' => token,
      'Content-Type' => 'application/json',
    }
  end

  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json',
    }
  end
end
