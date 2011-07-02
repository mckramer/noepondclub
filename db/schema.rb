# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110702034028) do

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "authorable_id"
    t.string   "authorable_type"
  end

  add_index "comments", ["authorable_id"], :name => "index_comments_on_authorable_id"
  add_index "comments", ["authorable_type"], :name => "index_comments_on_authorable_type"
  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"

  create_table "dependents", :force => true do |t|
    t.string   "name_first"
    t.string   "name_middle"
    t.string   "name_last"
    t.string   "email"
    t.date     "dob"
    t.date     "emblem_redfrog"
    t.date     "emblem_bluefrog"
    t.date     "emblem_greenfish"
    t.date     "emblem_goldfish"
    t.date     "emblem_redshark"
    t.date     "emblem_maroonshark"
    t.date     "emblem_silverdolphin"
    t.date     "emblem_goldendolphin"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "independents", :force => true do |t|
    t.string   "name_first"
    t.string   "name_middle"
    t.string   "name_last"
    t.string   "name_suffix"
    t.string   "email"
    t.string   "phone"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.integer  "badge"
    t.string   "membership"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "members", ["badge"], :name => "index_members_on_badge", :unique => true
  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true
  add_index "members", ["unlock_token"], :name => "index_members_on_unlock_token", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tennis_reservations", :force => true do |t|
    t.integer  "member_id"
    t.date     "date"
    t.integer  "start_at"
    t.integer  "end_at"
    t.integer  "court"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
