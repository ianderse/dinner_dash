class ChangeItemDescriptionToText < ActiveRecord::Migration
  def up
    change_column :items, :description, :text, null: false
  end

  def down
    change_column :items, :description, :string, null: false
  end
end
