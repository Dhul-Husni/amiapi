# frozen_string_literal: true

class JsonWebToken
  ALGORITHM = 'HS256'
  HMAC_SECRET = Rails.application.credentials.secret_key_base

  def self.encode(payload)
    JWT.encode(payload, HMAC_SECRET, ALGORITHM)
  end

  def self.decode(token)
    body = JWT.decode(token, true, { algorithm: ALGORITHM }).first

    body.with_indifferent_access
  rescue *JWT_ERRORS => e
    Rails.logger.error("Token decode failed with #{e.class} | Token: #{token}")

    nil
  end
end
