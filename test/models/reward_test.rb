# frozen_string_literal: true

require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  test 'it does not allow unknown reward_types' do
    reward = rewards(:signup_incentive).dup
    reward.reward_type = 'unknown_type'
    assert_not reward.valid?

    reward.reward_type = Reward::REWARD_TYPES.first
    assert reward.valid?
  end

  test 'amount must be present' do
    reward = rewards(:signup_incentive).dup
    reward.amount = nil
    assert_not reward.valid?

    reward.amount = 10
    assert reward.valid?
  end

  test 'amount must be a number' do
    reward = rewards(:signup_incentive).dup
    reward.amount = 'string'
    assert_not reward.valid?

    reward.amount = 10
    assert reward.valid?
  end
end
