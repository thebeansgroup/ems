class CreateEmsReportsTags < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_reports_tags, :id => false do |t|
      t.integer :report_id, :null => false
      t.integer :tag_id, :null => false
    end

    # Add table index
    add_index :ems_reports_tags, [:report_id, :tag_id], :unique => true
  end

  def down
  end
end
