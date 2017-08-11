class CreateParents < ActiveRecord::Migration[5.0]
  def change
    create_table :parents do |t|
      t.integer :user_id
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
