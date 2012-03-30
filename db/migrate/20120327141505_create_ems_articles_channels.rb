class CreateEmsArticlesChannels < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_articles_channels, :id => false do |t|
      t.integer :article_id, :null => false
      t.integer :channel_id, :null => false
    end

    # Add table index
    add_index :ems_articles_channels, [:article_id, :channel_id], :unique => true
  end

  def down
  end
end
