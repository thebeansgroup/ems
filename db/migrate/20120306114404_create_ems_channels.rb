class CreateEmsChannels < ActiveRecord::Migration
  def change
    create_table :ems_channels do |t|
      t.string :slug
      t.string :name

      t.timestamps
    end
  end
end
