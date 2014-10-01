class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :role
      t.references :user, index: true

      t.timestamps
    end
  end
end
