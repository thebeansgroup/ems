class CreateEmsReportsReports < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_reports_reports, :id => false do |t|
      t.integer :report_id, :null => false
      t.integer :related_id, :null => false
    end

    # Add table index
    add_index :ems_reports_reports, [:report_id, :related_id], :unique => true
  end

  def down
  end
end
