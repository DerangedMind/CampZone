class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :camp_id
      t.string :name
      t.integer :min_age
      t.integer :max_age
      t.date :startdate

      t.timestamps
    end
  end
end
