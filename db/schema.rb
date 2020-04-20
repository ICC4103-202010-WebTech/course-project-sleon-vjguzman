# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_20_161056) do

  create_table "choice_of_dates", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "event_creators", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_event_creators_on_event_id"
    t.index ["user_id"], name: "index_event_creators_on_user_id"
  end

  create_table "event_dates", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_event_dates_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.text "description"
    t.string "location"
    t.datetime "final_date"
    t.datetime "creation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "choice_of_date_id"
    t.integer "privacy_id"
    t.integer "organization_id"
    t.index ["choice_of_date_id"], name: "index_events_on_choice_of_date_id"
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["privacy_id"], name: "index_events_on_privacy_id"
  end

  create_table "guest_lists", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_guest_lists_on_event_id"
    t.index ["user_id"], name: "index_guest_lists_on_user_id"
  end

  create_table "mail_boxes", force: :cascade do |t|
    t.datetime "date"
    t.string "from_message"
    t.string "from_username"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_mail_boxes_on_user_id"
  end

  create_table "members_lists", force: :cascade do |t|
    t.string "user_role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "organization_id"
    t.index ["organization_id"], name: "index_members_lists_on_organization_id"
    t.index ["user_id"], name: "index_members_lists_on_user_id"
  end

  create_table "multimedia", force: :cascade do |t|
    t.string "file_name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_multimedia_on_event_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "received_date"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_notifications_on_event_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "privacies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reports", force: :cascade do |t|
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_reports_on_event_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "sent_messages", force: :cascade do |t|
    t.datetime "date"
    t.string "to_email"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_sent_messages_on_user_id"
  end

  create_table "system_admins", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.boolean "admin"
    t.index ["user_id"], name: "index_system_admins_on_user_id"
  end

  create_table "user_administrations", force: :cascade do |t|
    t.datetime "last_access"
    t.string "user_role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_user_administrations_on_user_id"
  end

  create_table "user_invitations", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "event_id"
    t.index ["event_id"], name: "index_user_invitations_on_event_id"
    t.index ["user_id"], name: "index_user_invitations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "full_name"
    t.text "short_bio"
    t.string "location"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "guest_list_id"
    t.integer "event_dates_id"
    t.index ["event_dates_id"], name: "index_votes_on_event_dates_id"
    t.index ["guest_list_id"], name: "index_votes_on_guest_list_id"
  end

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users"
  add_foreign_key "event_creators", "events"
  add_foreign_key "event_creators", "users"
  add_foreign_key "event_dates", "events"
  add_foreign_key "events", "choice_of_dates"
  add_foreign_key "events", "organizations"
  add_foreign_key "events", "privacies"
  add_foreign_key "guest_lists", "events"
  add_foreign_key "guest_lists", "users"
  add_foreign_key "mail_boxes", "users"
  add_foreign_key "members_lists", "organizations"
  add_foreign_key "members_lists", "users"
  add_foreign_key "multimedia", "events"
  add_foreign_key "notifications", "events"
  add_foreign_key "notifications", "users"
  add_foreign_key "reports", "events"
  add_foreign_key "reports", "users"
  add_foreign_key "sent_messages", "users"
  add_foreign_key "system_admins", "users"
  add_foreign_key "user_administrations", "users"
  add_foreign_key "user_invitations", "events"
  add_foreign_key "user_invitations", "users"
  add_foreign_key "votes", "event_dates", column: "event_dates_id"
  add_foreign_key "votes", "guest_lists"
end
