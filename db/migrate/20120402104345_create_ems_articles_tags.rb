class CreateEmsArticlesTags < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_articles_tags, :id => false do |t|
      t.integer :article_id, :null => false
      t.integer :tag_id, :null => false
    end

    # Add table index
    add_index :ems_articles_tags, [:article_id, :tag_id], :unique => true
  end

  def down
  end
end
