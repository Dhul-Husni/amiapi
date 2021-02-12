# frozen_string_literal: true

class User < ApplicationRecord
  extend FriendlyId
  friendly_id :referral_code

  has_secure_password

  has_many :sent_referrals, class_name: 'Referral', foreign_key: :inviter_id,
                            inverse_of: :inviter, dependent: :destroy
  has_many :invited_users, through: :sent_referrals, source: :invitee
  has_many :rewards, dependent: :destroy

  has_one :received_referral, class_name: 'Referral', foreign_key: :invitee_id,
                              inverse_of: :invitee, dependent: :destroy
  has_one :inviter, through: :received_referral, source: :inviter

  before_validation :downcase_email
  before_validation :set_referral_code, on: :create

  validates :username, :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, length: { minimum: 3 }
  validates :referral_code, uniqueness: true

  def refer(user)
    referral = Referral.new(inviter: self, invitee: user)
    sent_referrals << referral
  end

  def total_rewarded_amount
    rewards.map(&:amount).sum.to_f
  end

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def set_referral_code
    loop do
      self.referral_code = SecureRandom.urlsafe_base64(6, false).upcase
      break unless self.class.exists?(referral_code: referral_code)
    end
  end
end
