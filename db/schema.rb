# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20140520204140) do

  create_table "accidents", :force => true do |t|
    t.text     "info"
    t.integer  "taxist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "active_admin_gallery_images", :force => true do |t|
    t.integer "imageable_id"
    t.string  "imageable_type"
    t.string  "imageable_relation"
    t.string  "alt"
    t.string  "title"
    t.string  "image_name"
    t.string  "image_uid"
    t.integer "position"
    t.integer "image_width"
    t.integer "image_height"
    t.float   "image_aspect_ratio"
    t.integer "image_depth"
    t.string  "image_format"
    t.string  "image_mime_type"
    t.string  "image_size"
  end

  add_index "active_admin_gallery_images", ["imageable_id", "imageable_type", "imageable_relation"], :name => "active_admin_gallery_images_imageable"

  create_table "addons", :force => true do |t|
    t.text     "text"
    t.integer  "taxist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "level_id"
    t.string   "strict_password"
    t.datetime "last_active_at"
    t.string   "name"
    t.string   "fio"
    t.string   "first_phone"
    t.string   "second_phone"
    t.integer  "views_count",            :default => -1
    t.string   "organization"
    t.string   "third_phone"
    t.string   "scan_ogrn"
    t.boolean  "active",                 :default => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assets", :force => true do |t|
    t.string   "storage_uid"
    t.string   "storage_name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "storage_width"
    t.integer  "storage_height"
    t.float    "storage_aspect_ratio"
    t.integer  "storage_depth"
    t.string   "storage_format"
    t.string   "storage_mime_type"
    t.string   "storage_size"
  end

  create_table "attachments", :force => true do |t|
    t.string   "file"
    t.integer  "addon_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "attachmentable_id"
    t.string   "attachmentable_type"
  end

  create_table "autos", :force => true do |t|
    t.integer  "taxist_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "levels", :force => true do |t|
    t.integer  "number"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pasport_scans", :force => true do |t|
    t.string   "file"
    t.integer  "taxist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "name"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reputations", :force => true do |t|
    t.text     "info"
    t.integer  "taxist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rich_rich_files", :force => true do |t|
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        :default => "file"
  end

  create_table "site_params", :force => true do |t|
    t.text     "key"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statistics", :force => true do |t|
    t.text     "key"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taxist_photos", :force => true do |t|
    t.integer  "taxist_id"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taxist_relatives", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "third_name"
    t.text     "work_place"
    t.string   "work_post"
    t.string   "third_phone"
    t.string   "first_phone"
    t.string   "second_phone"
    t.integer  "taxist_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "taxist_searches", :force => true do |t|
    t.text     "search"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taxists", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "third_name"
    t.string   "photo"
    t.text     "address"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "checked",            :default => false
    t.integer  "user_id"
    t.string   "pasport_number"
    t.text     "pasport_info"
    t.string   "vodit_ustov_number"
    t.date     "vodit_ustov_date"
    t.string   "vodit_ustov_file"
    t.string   "anketa"
    t.string   "pozivnoy"
    t.text     "fssp_info"
    t.date     "birthdate"
    t.integer  "search_count",       :default => 0
    t.string   "am"
  end

end
