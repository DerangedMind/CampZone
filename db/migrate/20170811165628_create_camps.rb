class CreateCamps < ActiveRecord::Migration[5.0]
  def change
    create_table :camps do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.timestamps
    end

    create_table :camp_directors do |t|
      t.integer :user_id
      t.integer :camp_id
      t.timestamps
    end
  end
end
