class CreateEmsRolesUsers < ActiveRecord::Migration
  def change
    create_table :ems_roles_users, :id => false do |t|
      t.references :ems_role, :user
    end
  end

  def down
    drop_table :ems_roles_users
  end
end
