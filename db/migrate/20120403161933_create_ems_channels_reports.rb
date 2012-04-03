class CreateEmsChannelsReports < ActiveRecord::Migration
  def up
    # Create the association table
    create_table :ems_channels_reports, :id => false do |t|
      t.integer :channel_id, :null => false
      t.integer :report_id, :null => false
    end

    # Add table index
    add_index :ems_channels_reports, [:channel_id, :report_id], :unique => true
  end

  def down
  end
end
