class AddReferralCodeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :referral_code, :string, null: false, index: { unique: true }
  end
end
