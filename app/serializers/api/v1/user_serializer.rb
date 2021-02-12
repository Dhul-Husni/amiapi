# frozen_string_literal: true

class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes(*User.attribute_names - %w[created_at updated_at password_digest])

  attribute :total_rewarded_amount
  attribute :referral_link

  def referral_link
    api_v1_signup_path(referral_code: object.referral_code)
  end
end
