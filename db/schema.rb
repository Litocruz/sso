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

ActiveRecord::Schema.define(:version => 20130911215013) do

  create_table "employees", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "sex"
    t.string   "address"
    t.boolean  "trainer"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "document_number"
    t.string   "document_type"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.boolean  "status",          :default => true
  end

  add_index "employees", ["document_number"], :name => "index_employees_on_document_number", :unique => true
  add_index "employees", ["remember_token"], :name => "index_employees_on_remember_token"

end
