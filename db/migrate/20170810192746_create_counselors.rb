class CreateCounselors < ActiveRecord::Migration[5.0]
  def change
    create_table :counselors do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :alias
      t.boolean :training
      t.string :account_status

      t.timestamps
    end
  end
end
