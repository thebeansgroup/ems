class CreateEmsNewsNews < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_news_news, :id => false do |t|
      t.integer :news_id, :null => false
      t.integer :related_id, :null => false
    end

    # Add table index
    add_index :ems_news_news, [:news_id, :related_id], :unique => true
  end

  def down
  end
end
