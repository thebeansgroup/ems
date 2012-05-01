class CreateEmsReports < ActiveRecord::Migration
  def change
    create_table :ems_reports do |t|
      t.string :slug
      t.string :title
      t.text :standfirst
      t.text :content
      t.boolean :hot
      t.boolean :featured
      t.boolean :toc
      t.boolean :comment
      t.string :meta_title
      t.text :meta_description
      t.datetime :publish_from
      t.string :status
      t.string :content_disposition
      t.integer :category_id
      # paperclip
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :report_file_name
      t.string :report_content_type
      t.integer :report_file_size
      t.datetime :report_updated_at
      
      t.timestamps
    end
  end
end
