class CreateEmsChannelsNews < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_channels_news, :id => false do |t|
      t.integer :channel_id, :null => false
      t.integer :news_id, :null => false
    end

    # Add table index
    add_index :ems_channels_news, [:channel_id, :news_id], :unique => true
  end

  def down
  end
end
