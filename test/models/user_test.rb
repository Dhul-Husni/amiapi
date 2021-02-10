require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # todo: it has a unique email
  # todo: has unique username
  # todo: has a secure password

  test '#refer' do
    user = users(:dhul)
    invitee = users(:unreferred_user)

    refute user.sent_referrals.find_by(invitee: invitee)
    refute user.invited_users.include? invitee
    refute invitee.inviter, user

    user.refer(invitee)
    user.reload
    invitee.reload

    assert user.sent_referrals.find_by(invitee: invitee)
    assert user.invited_users.include? invitee
    assert invitee.received_referral, user.sent_referrals.find_by(invitee: invitee)
    assert invitee.inviter, user
  end
end
