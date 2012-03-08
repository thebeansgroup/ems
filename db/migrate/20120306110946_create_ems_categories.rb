class CreateEmsCategories < ActiveRecord::Migration
  def change
    create_table :ems_categories do |t|
      t.string :slug
      t.string :name
      t.text :strapline

      t.timestamps
    end
  end
end
