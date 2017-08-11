class CreateKids < ActiveRecord::Migration[5.0]
  def change
    create_table :kids do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :sin
      t.string :medicare

      t.timestamps
    end
  end
end
