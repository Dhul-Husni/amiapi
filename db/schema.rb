# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_11_224159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "referrals", force: :cascade do |t|
    t.integer "inviter_id", null: false
    t.integer "invitee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invitee_id"], name: "index_referrals_on_invitee_id", unique: true
    t.index ["inviter_id"], name: "index_referrals_on_inviter_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "reward_type", null: false
    t.bigint "user_id", null: false
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reward_type"], name: "index_rewards_on_reward_type"
    t.index ["user_id"], name: "index_rewards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "referral_code", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
