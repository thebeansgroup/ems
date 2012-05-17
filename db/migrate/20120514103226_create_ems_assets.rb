class CreateEmsAssets < ActiveRecord::Migration
  def change
    create_table :ems_assets do |t|
      t.string :title
      # paperclip
      t.string :asset_file_name
      t.string :asset_content_type
      t.integer :asset_file_size
      t.datetime :asset_updated_at
      
      t.references :assetable, :polymorphic => true
      t.timestamps
    end
  end
end
