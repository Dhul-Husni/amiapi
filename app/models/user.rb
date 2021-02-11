# frozen_string_literal: true

class User < ApplicationRecord
  has_many :sent_referrals, class_name: 'Referral', foreign_key: :inviter_id,
                            inverse_of: :inviter, dependent: :destroy
  has_many :invited_users, through: :sent_referrals, source: :invitee
  has_many :rewards, dependent: :destroy

  has_one :received_referral, class_name: 'Referral', foreign_key: :invitee_id,
                              inverse_of: :invitee, dependent: :destroy
  has_one :inviter, through: :received_referral, source: :inviter

  def refer(user)
    referral = Referral.new(inviter: self, invitee: user)
    sent_referrals << referral
  end
end
