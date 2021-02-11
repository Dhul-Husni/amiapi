# frozen_string_literal: true

class Referral < ApplicationRecord
  belongs_to :inviter, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

  validates :invitee_id, uniqueness: true

  after_create :reward_inviter, :reward_invitee

  REFERRAL_SIGN_UP_REWARD = 10 # dollars
  REFERRER_REWARD = 10

  private

  def reward_inviter
    reward = Reward.referrer_incentives.new(
      amount: REFERRER_REWARD,
    )

    inviter.rewards << reward
  end

  def reward_invitee
    reward = Reward.signup_incentives.new(
      amount: REFERRER_REWARD,
    )

    invitee.rewards << reward
  end
end
