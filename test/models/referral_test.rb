require "test_helper"

class ReferralTest < ActiveSupport::TestCase
  test 'it validates uniqueness of invitee_id' do
    referral = referrals(:one).dup
    assert_not referral.valid?

    referral.invitee = users(:unreferred_user)
    assert referral.valid?
  end
end
