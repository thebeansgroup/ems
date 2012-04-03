class CreateEmsNews < ActiveRecord::Migration
  def change
    create_table :ems_news do |t|
      t.string :slug
      t.string :title
      t.text :standfirst
      t.text :content
      t.boolean :hot
      t.boolean :featured
      t.boolean :comment
      t.string :meta_title
      t.text :meta_description
      t.datetime :publish_from
      t.string :status
      t.string :content_disposition
      t.integer :category_id

      t.timestamps
    end
  end
end
