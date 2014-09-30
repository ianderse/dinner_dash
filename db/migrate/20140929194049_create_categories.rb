class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :title, null: false
    	t.string :description, null: false

      t.timestamps
    end
  end
end
