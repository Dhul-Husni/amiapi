# frozen_string_literal: true

class Reward < ApplicationRecord
  belongs_to :user

  REWARD_TYPES = %w(
    signup_incentive
    referrer_incentive
  ).freeze

  validates :reward_type, inclusion: { in: REWARD_TYPES }
  validates :amount, presence: true, numericality: true

  scope :signup_incentives, -> { where(reward_type: :signup_incentive) }
  scope :referrer_incentives, -> { where(reward_type: :referrer_incentive) }
end
