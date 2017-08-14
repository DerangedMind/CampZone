class CreateKidsParents < ActiveRecord::Migration[5.0]
  def change
    create_table :kids_parents do |t|
      t.integer :user_id
      t.integer :kid_id
      t.string :parent_status

      t.timestamps
    end
  end
end