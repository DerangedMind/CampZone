class RemoveDirectorCamps < ActiveRecord::Migration[5.0]
  def change

    drop_table :camps_directors

    add_column :camps, :director_id, :integer

  end
end
