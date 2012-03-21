class CreateEmsRoleUsers < ActiveRecord::Migration
  def change
    create_table :ems_role_users do |t|

      t.timestamps
    end
  end
end
