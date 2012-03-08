class CreateEmsCategoriesChannels < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_categories_channels, :id => false do |t|
      t.integer :category_id, :null => false
      t.integer :channel_id, :null => false
    end

    # Add table index
    add_index :ems_categories_channels, [:category_id, :channel_id], :unique => true
  end

  def down
  end
end
