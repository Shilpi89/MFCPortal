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

ActiveRecord::Schema.define(:version => 20121004143118) do

  create_table "activities", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "description"
    t.integer  "created_by",  :null => false
    t.integer  "updated_by",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "description"
    t.datetime "start_date",  :null => false
    t.datetime "end_date",    :null => false
    t.integer  "category",    :null => false
    t.integer  "created_by",  :null => false
    t.integer  "updated_by",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events_activities", :force => true do |t|
    t.integer  "event_id"
    t.integer  "activity_id"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "events_activities", ["activity_id"], :name => "idx_events_acts_activity_id"
  add_index "events_activities", ["event_id"], :name => "idx_events_acts_event_id"

  create_table "expenses", :force => true do |t|
    t.string   "description", :null => false
    t.float    "amount",      :null => false
    t.integer  "created_by",  :null => false
    t.integer  "updated_by",  :null => false
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "expenses", ["event_id"], :name => "idx_expenses_event_id"

end
