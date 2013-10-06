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

ActiveRecord::Schema.define(:version => 20131004151337) do

  create_table "countries", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "driver_licenses", :id => false, :force => true do |t|
    t.string   "driver_license_code_id"
    t.date     "expiration"
    t.integer  "employee_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "description"
  end

  add_index "driver_licenses", ["employee_id", "created_at"], :name => "index_driver_licenses_on_employee_id_and_created_at"

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "sex"
    t.string   "address"
    t.boolean  "trainer"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "document_number"
    t.string   "document_type"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.boolean  "status",                  :default => true
    t.string   "city"
    t.string   "region"
    t.integer  "postal_code"
    t.string   "phone"
    t.string   "mobile"
    t.string   "skype"
    t.text     "notes"
    t.integer  "country_id"
    t.string   "work_schedule"
    t.string   "ppe"
    t.integer  "special_habilitation_id", :default => 0
  end

  add_index "employees", ["document_number"], :name => "index_employees_on_document_number", :unique => true
  add_index "employees", ["remember_token"], :name => "index_employees_on_remember_token"

  create_table "special_habilitations", :force => true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "studies", :force => true do |t|
    t.string   "title"
    t.string   "place"
    t.date     "date"
    t.text     "description"
    t.integer  "employee_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "studies", ["employee_id", "created_at"], :name => "index_studies_on_employee_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
