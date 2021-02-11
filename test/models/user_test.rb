# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # TODO: it has a unique email
  # todo: has a secure password

  test 'it should validate presence of :username' do
    user = users(:dhul).dup
    user.username = nil
    assert_not user.valid?

    user.username = 'mike'
    assert user.valid?
  end

  test 'it should validate presence of :username length' do
    user = users(:dhul).dup
    user.username = 'o'
    assert_not user.valid?

    user.username = 'mike'
    assert user.valid?
  end

  test 'it should validate presence of :email' do
    user = users(:dhul).dup
    user.email = nil
    assert_not user.valid?

    user.email = 'mike@gmail.com'
    assert user.valid?
  end

  test 'it should validate format of :email' do
    # user = users(:dhul).dup
    # user.email = nil
    # assert_not user.valid?

    # user.email = 'mike@gmail.com'
    # assert user.valid?
  end

  test 'it should validate presence of :password_digest' do
    user = users(:dhul).dup
    user.password_digest = nil
    assert_not user.valid?

    user.password_digest = 'randomEncryption'
    assert user.valid?
  end

  test '#refer' do
    user = users(:dhul)
    invitee = users(:unreferred_user)

    assert_not user.sent_referrals.find_by(invitee: invitee)
    assert_not_includes user.invited_users, invitee
    assert_not invitee.inviter, user

    user.refer(invitee)
    user.reload
    invitee.reload

    assert user.sent_referrals.find_by(invitee: invitee)
    assert_includes user.invited_users, invitee
    assert invitee.received_referral, user.sent_referrals.find_by(invitee: invitee)
    assert invitee.inviter, user
  end

  test 'unreferred user does not get a reward' do
    user = users(:dhul).dup
    user.email = 'new@email.com'
    user.save

    assert user.rewards, 0
  end

  test 'referred user gets a reward' do
    user = users(:dhul).dup
    user.email = 'new@email.com'
    user.save

    assert user.rewards, 0

    inviter = users(:dhul)
    inviter.refer(user)

    assert user.rewards, 1
  end
end
