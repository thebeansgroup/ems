class CreateEmsTags < ActiveRecord::Migration
  def change
    create_table :ems_tags do |t|
      t.string :title
      t.string :slug
      t.text :description

      t.timestamps
    end
  end
end
