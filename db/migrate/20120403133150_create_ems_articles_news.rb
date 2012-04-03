class CreateEmsArticlesNews < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_articles_news, :id => false do |t|
      t.integer :article_id, :null => false
      t.integer :news_id, :null => false
    end

    # Add table index
    add_index :ems_articles_news, [:article_id, :news_id], :unique => true
  end

  def down
  end
end
