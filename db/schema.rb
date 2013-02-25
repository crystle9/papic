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

ActiveRecord::Schema.define(:version => 20120320124617) do

  create_table "child_profiles", :force => true do |t|
    t.string   "subject",      :null => false
    t.string   "sex",          :null => false
    t.integer  "age"
    t.string   "grade"
    t.text     "introduction"
    t.integer  "job_id",       :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "child_profiles", ["job_id"], :name => "index_child_profiles_on_job_id"

  create_table "company_profiles", :force => true do |t|
    t.string   "name",                 :null => false
    t.integer  "user_profile_id",      :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "license_file_name"
    t.string   "license_content_type"
    t.integer  "license_file_size"
    t.datetime "license_updated_at"
  end

  add_index "company_profiles", ["user_profile_id"], :name => "index_company_profiles_on_user_profile_id"

  create_table "contacts", :force => true do |t|
    t.string   "phone_type"
    t.integer  "phone"
    t.integer  "user_profile_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "contacts", ["user_profile_id"], :name => "index_contacts_on_user_profile_id"

  create_table "job_profiles", :force => true do |t|
    t.string   "address"
    t.date     "stop_employ_at"
    t.date     "start_work_at"
    t.decimal  "amount"
    t.text     "description"
    t.string   "sex"
    t.string   "campus"
    t.string   "grade"
    t.string   "major"
    t.string   "hometown"
    t.integer  "job_id",         :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
  end

  add_index "job_profiles", ["job_id"], :name => "index_job_profiles_on_job_id"

  create_table "jobs", :force => true do |t|
    t.string   "name",       :limit => 20, :null => false
    t.decimal  "pay",                      :null => false
    t.string   "state",                    :null => false
    t.string   "category"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "letters", :force => true do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.text    "content"
    t.string  "state"
  end

  add_index "letters", ["receiver_id"], :name => "index_letters_on_receiver_id"
  add_index "letters", ["sender_id"], :name => "index_letters_on_sender_id"

  create_table "places", :force => true do |t|
    t.string   "address_type"
    t.string   "address"
    t.integer  "user_profile_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "places", ["user_profile_id"], :name => "index_places_on_user_profile_id"

  create_table "resumes", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.integer  "job_id",                        :null => false
    t.text     "note"
    t.boolean  "accepted",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "resumes", ["job_id"], :name => "index_resumes_on_job_id"
  add_index "resumes", ["user_id"], :name => "index_resumes_on_user_id"

  create_table "student_profiles", :force => true do |t|
    t.integer  "student_card",    :null => false
    t.string   "campus"
    t.string   "grade"
    t.string   "major"
    t.string   "hometown"
    t.integer  "user_profile_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "student_profiles", ["user_profile_id"], :name => "index_student_profiles_on_user_profile_id"

  create_table "user_profiles", :force => true do |t|
    t.string   "first_name",          :null => false
    t.string   "family_name",         :null => false
    t.string   "sex",                 :null => false
    t.string   "email",               :null => false
    t.text     "introduction"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "user_profiles", ["job_id"], :name => "index_user_profiles_on_job_id"
  add_index "user_profiles", ["user_id"], :name => "index_user_profiles_on_user_id"

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",               :null => false
    t.string   "persistence_token",   :null => false
    t.string   "crypted_password",    :null => false
    t.string   "password_salt",       :null => false
    t.string   "single_access_token", :null => false
    t.string   "role",                :null => false
    t.boolean  "is_frozen",           :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
