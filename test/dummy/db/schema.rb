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

ActiveRecord::Schema.define(:version => 20120308163733) do

  create_table "ems_articles", :force => true do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "standfirst"
    t.text     "content"
    t.boolean  "hot"
    t.boolean  "featured"
    t.boolean  "toc"
    t.boolean  "comment"
    t.string   "meta_title"
    t.text     "meta_description"
    t.datetime "publish_from"
    t.string   "status"
    t.string   "content_disposition"
    t.integer  "category_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "ems_categories", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.text     "strapline"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ems_categories_channels", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "channel_id",  :null => false
  end

  add_index "ems_categories_channels", ["category_id", "channel_id"], :name => "index_ems_categories_channels_on_category_id_and_channel_id", :unique => true

  create_table "ems_channels", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ems_tags", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
