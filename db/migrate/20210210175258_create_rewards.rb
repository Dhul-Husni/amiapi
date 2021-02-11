# frozen_string_literal: true

class CreateRewards < ActiveRecord::Migration[6.1]
  def change
    create_table :rewards do |t|
      t.string :reward_type, null: false, index: true
      t.references :user, null: false
      t.decimal :amount, null: false, precision: 8, scale: 2, default: 0

      t.timestamps
    end
  end
end
