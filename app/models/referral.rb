# frozen_string_literal: true

class Referral < ApplicationRecord
  belongs_to :inviter, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

  validates :invitee_id, uniqueness: true

  after_create :reward_inviter, :reward_invitee

  REFERRAL_SIGN_UP_REWARD = 10 # dollars
  REFERRER_REWARD = 10
  SENT_REFERRALS_TARGET = 5

  private

  def reward_inviter
    return unless eligible_for_referrer_reward?(inviter)

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

  # eligible for reward everytime they hit the target
  def eligible_for_referrer_reward?(user)
    user.sent_referrals.size % SENT_REFERRALS_TARGET == 0
  end
end
