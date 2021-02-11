# frozen_string_literal: true

require 'test_helper'

class ReferralTest < ActiveSupport::TestCase
  test 'it validates uniqueness of invitee_id' do
    referral = referrals(:one).dup
    assert_not referral.valid?

    referral.invitee = users(:unreferred_user)
    assert referral.valid?
  end

  test 'it rewards inviter' do
    inviter = users(:dhul).dup
    invitee = users(:unreferred_user)

    assert_not Reward.referrer_incentives.find_by(user: inviter)

    Referral.create(inviter: inviter, invitee: invitee)

    assert Reward.referrer_incentives.find_by(user: inviter)
  end

  test 'it rewards new referral signup' do
    inviter = users(:dhul).dup
    invitee = users(:unreferred_user)

    assert_not Reward.signup_incentives.find_by(user: inviter)

    Referral.create(inviter: inviter, invitee: invitee)

    assert Reward.signup_incentives.find_by(user: invitee)
  end
end
