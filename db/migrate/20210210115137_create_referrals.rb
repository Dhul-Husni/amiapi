# frozen_string_literal: true

class CreateReferrals < ActiveRecord::Migration[6.1]
  def change
    create_table :referrals do |t|
      t.integer :inviter_id, null: false, index: true
      t.integer :invitee_id, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
