class CreateReferrals < ActiveRecord::Migration[6.1]
  def change
    create_table :referrals do |t|
      t.integer :inviter_id, null: false, index: true
      t.integer :invitee_id, null: false, unique: true, index: true

      t.timestamps
    end
  end
end
