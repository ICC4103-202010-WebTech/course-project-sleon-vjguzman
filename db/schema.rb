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

ActiveRecord::Schema.define(version: 2020_07_05_050707) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.integer "active_storage_blobs_id", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

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

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "title"
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

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "multimedia", force: :cascade do |t|
    t.string "file_name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_multimedia_on_event_id"
  end

  create_table "name_reports", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "replies", force: :cascade do |t|
    t.integer "user_id_id", null: false
    t.text "message"
    t.integer "event_id_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id_id"], name: "index_replies_on_event_id_id"
    t.index ["user_id_id"], name: "index_replies_on_user_id_id"
  end

  create_table "reply_comments", force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_reply_comments_on_comment_id"
    t.index ["event_id"], name: "index_reply_comments_on_event_id"
    t.index ["user_id"], name: "index_reply_comments_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "event_id"
    t.integer "name_reports_id", null: false
    t.index ["event_id"], name: "index_reports_on_event_id"
    t.index ["name_reports_id"], name: "index_reports_on_name_reports_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "tipos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "last_active_at"
    t.string "provider"
    t.string "uid"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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
  add_foreign_key "replies", "event_ids"
  add_foreign_key "replies", "user_ids"
  add_foreign_key "reply_comments", "comments"
  add_foreign_key "reply_comments", "events"
  add_foreign_key "reply_comments", "users"
  add_foreign_key "reports", "events"
  add_foreign_key "reports", "name_reports", column: "name_reports_id"
  add_foreign_key "reports", "users"
  add_foreign_key "sent_messages", "users"
  add_foreign_key "system_admins", "users"
  add_foreign_key "user_administrations", "users"
  add_foreign_key "user_invitations", "events"
  add_foreign_key "user_invitations", "users"
  add_foreign_key "votes", "event_dates", column: "event_dates_id"
  add_foreign_key "votes", "guest_lists"
end
