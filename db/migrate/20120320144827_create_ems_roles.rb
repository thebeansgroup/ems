class CreateEmsRoles < ActiveRecord::Migration
  def change
    create_table :ems_roles do |t|
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :ems_roles
  end
end
