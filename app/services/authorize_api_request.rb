# frozen_string_literal: true

class AuthorizeApiRequest
  prepend SimpleCommand

  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  def user
    @user ||= User.find_by(id: decoded_auth_token.try(:[], :user_id)) if decoded_auth_token
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_token)
  end

  def http_auth_token
    return if headers['Authorization'].blank?

    headers['Authorization'].split(' ').last
  end
end
