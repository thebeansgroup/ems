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

ActiveRecord::Schema.define(:version => 20120514103226) do

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
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "ems_articles_articles", :id => false, :force => true do |t|
    t.integer "article_id", :null => false
    t.integer "related_id", :null => false
  end

  add_index "ems_articles_articles", ["article_id", "related_id"], :name => "index_ems_articles_articles_on_article_id_and_related_id", :unique => true

  create_table "ems_articles_channels", :id => false, :force => true do |t|
    t.integer "article_id", :null => false
    t.integer "channel_id", :null => false
  end

  add_index "ems_articles_channels", ["article_id", "channel_id"], :name => "index_ems_articles_channels_on_article_id_and_channel_id", :unique => true

  create_table "ems_articles_news", :id => false, :force => true do |t|
    t.integer "article_id", :null => false
    t.integer "news_id",    :null => false
  end

  add_index "ems_articles_news", ["article_id", "news_id"], :name => "index_ems_articles_news_on_article_id_and_news_id", :unique => true

  create_table "ems_articles_reports", :id => false, :force => true do |t|
    t.integer "article_id", :null => false
    t.integer "report_id",  :null => false
  end

  add_index "ems_articles_reports", ["article_id", "report_id"], :name => "index_ems_articles_reports_on_article_id_and_report_id", :unique => true

  create_table "ems_articles_tags", :id => false, :force => true do |t|
    t.integer "article_id", :null => false
    t.integer "tag_id",     :null => false
  end

  add_index "ems_articles_tags", ["article_id", "tag_id"], :name => "index_ems_articles_tags_on_article_id_and_tag_id", :unique => true

  create_table "ems_assets", :force => true do |t|
    t.string   "title"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
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

  create_table "ems_channels_news", :id => false, :force => true do |t|
    t.integer "channel_id", :null => false
    t.integer "news_id",    :null => false
  end

  add_index "ems_channels_news", ["channel_id", "news_id"], :name => "index_ems_channels_news_on_channel_id_and_news_id", :unique => true

  create_table "ems_channels_reports", :id => false, :force => true do |t|
    t.integer "channel_id", :null => false
    t.integer "report_id",  :null => false
  end

  add_index "ems_channels_reports", ["channel_id", "report_id"], :name => "index_ems_channels_reports_on_channel_id_and_report_id", :unique => true

  create_table "ems_news", :force => true do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "standfirst"
    t.text     "content"
    t.boolean  "hot"
    t.boolean  "featured"
    t.boolean  "comment"
    t.string   "meta_title"
    t.text     "meta_description"
    t.datetime "publish_from"
    t.string   "status"
    t.string   "content_disposition"
    t.integer  "category_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "ems_news_news", :id => false, :force => true do |t|
    t.integer "news_id",    :null => false
    t.integer "related_id", :null => false
  end

  add_index "ems_news_news", ["news_id", "related_id"], :name => "index_ems_news_news_on_news_id_and_related_id", :unique => true

  create_table "ems_news_reports", :id => false, :force => true do |t|
    t.integer "news_id",   :null => false
    t.integer "report_id", :null => false
  end

  add_index "ems_news_reports", ["news_id", "report_id"], :name => "index_ems_news_reports_on_news_id_and_report_id", :unique => true

  create_table "ems_news_tags", :id => false, :force => true do |t|
    t.integer "news_id", :null => false
    t.integer "tag_id",  :null => false
  end

  add_index "ems_news_tags", ["news_id", "tag_id"], :name => "index_ems_news_tags_on_news_id_and_tag_id", :unique => true

  create_table "ems_reports", :force => true do |t|
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
    t.string   "download_cta"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "report_file_name"
    t.string   "report_content_type"
    t.integer  "report_file_size"
    t.datetime "report_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "ems_reports_reports", :id => false, :force => true do |t|
    t.integer "report_id",  :null => false
    t.integer "related_id", :null => false
  end

  add_index "ems_reports_reports", ["report_id", "related_id"], :name => "index_ems_reports_reports_on_report_id_and_related_id", :unique => true

  create_table "ems_reports_tags", :id => false, :force => true do |t|
    t.integer "report_id", :null => false
    t.integer "tag_id",    :null => false
  end

  add_index "ems_reports_tags", ["report_id", "tag_id"], :name => "index_ems_reports_tags_on_report_id_and_tag_id", :unique => true

  create_table "ems_roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ems_roles_users", :id => false, :force => true do |t|
    t.integer "ems_role_id"
    t.integer "user_id"
  end

  create_table "ems_tags", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
