class CreateEmsNewsReports < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_news_reports, :id => false do |t|
      t.integer :news_id, :null => false
      t.integer :report_id, :null => false
    end

    # Add table index
    add_index :ems_news_reports, [:news_id, :report_id], :unique => true
  end

  def down
  end
end
