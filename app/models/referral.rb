class Referral < ApplicationRecord
  belongs_to :inviter, class_name: 'User'
  belongs_to :invitee, class_name: 'User'

  validates :invitee_id, uniqueness: true
end
