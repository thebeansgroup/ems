class CreateEmsArticlesArticles < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_articles_articles, :id => false do |t|
      t.integer :article_id, :null => false
      t.integer :related_id, :null => false
    end

    # Add table index
    add_index :ems_articles_articles, [:article_id, :related_id], :unique => true
  end

  def down
  end
end
