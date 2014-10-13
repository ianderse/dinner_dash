class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.float :stars
      t.references :item, index: true
      t.references :user, index: true
    end
  end
end
