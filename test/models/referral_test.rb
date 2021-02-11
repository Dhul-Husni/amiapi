# frozen_string_literal: true

require 'test_helper'

class ReferralTest < ActiveSupport::TestCase
  test 'it validates uniqueness of invitee_id' do
    referral = referrals(:one).dup
    assert_not referral.valid?

    referral.invitee = users(:unreferred_user)
    assert referral.valid?
  end

  test 'it does not reward users who have already been invited' do
    inviter = users(:dhul)
    invitee = users(:unreferred_user)

    assert_not Reward.signup_incentives.find_by(user: invitee)

    Referral.create(inviter: inviter, invitee: invitee)
    assert Reward.signup_incentives.where(user: invitee).size, 1

    Referral.create(inviter: inviter, invitee: invitee)
    assert Reward.signup_incentives.where(user: invitee).size, 1
  end

  test 'it does not rewards inviters who have not reached the target referrals' do
    inviter = users(:dhul)
    invitee = users(:unreferred_user)

    assert_not Reward.referrer_incentives.find_by(user: inviter)

    Referral.create(inviter: inviter, invitee: invitee)
    assert_not Reward.referrer_incentives.find_by(user: inviter)
  end

  test 'it rewards inviter if they are eligible for reward' do
    inviter = users(:dhul)
    invitee = users(:unreferred_user)

    assert_not Reward.referrer_incentives.find_by(user: inviter)

    Referral::SENT_REFERRALS_TARGET.times do |i|
      invitee = users(:unreferred_user).dup
      invitee.username = "new_user#{i}"
      invitee.save

      Referral.create(inviter: inviter, invitee: invitee)
    end

    assert Reward.referrer_incentives.where(user: inviter).size, 1
  end

  test 'it rewards new referral signup' do
    inviter = users(:dhul)
    invitee = users(:unreferred_user)

    assert_not Reward.signup_incentives.find_by(user: invitee)

    Referral.create(inviter: inviter, invitee: invitee)
    assert Reward.signup_incentives.find_by(user: invitee)
  end
end
