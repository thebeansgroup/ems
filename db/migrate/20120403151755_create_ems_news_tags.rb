class CreateEmsNewsTags < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_news_tags, :id => false do |t|
      t.integer :news_id, :null => false
      t.integer :tag_id, :null => false
    end

    # Add table index
    add_index :ems_news_tags, [:news_id, :tag_id], :unique => true
  end

  def down
  end
end
