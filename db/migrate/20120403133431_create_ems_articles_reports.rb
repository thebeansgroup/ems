class CreateEmsArticlesReports < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_articles_reports, :id => false do |t|
      t.integer :article_id, :null => false
      t.integer :report_id, :null => false
    end

    # Add table index
    add_index :ems_articles_reports, [:article_id, :report_id], :unique => true
  end

  def down
  end
end
