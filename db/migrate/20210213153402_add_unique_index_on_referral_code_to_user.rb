class AddUniqueIndexOnReferralCodeToUser < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :referral_code, unique: true
  end
end
