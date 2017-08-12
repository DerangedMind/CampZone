class AddUserIdToDirectors < ActiveRecord::Migration[5.0]
  def change
    change_table :directors do |t|
      t.string :user_id
    end
  end
end
