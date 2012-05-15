class CreateEmsImages < ActiveRecord::Migration
  def change
    create_table :ems_images do |t|
      t.string :title
      t.string :alt
      # paperclip
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      
      t.references :imageable, :polymorphic => true
      t.timestamps
    end
  end
end
