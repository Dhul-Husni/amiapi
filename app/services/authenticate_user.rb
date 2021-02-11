# frozen_string_literal: true

class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  def user
    user = User.find_by(email: @email)
    return user if user&.authenticate(@password)

    errors.add(:base, :invalid_credentials) # todo: internationalization
    nil
  end
end
