class CreateDirectors < ActiveRecord::Migration[5.0]
  def change
    create_table :directors do |t|
      t.string :privileges

      t.timestamps
    end

    create_join_table :camps, :directors

    drop_table :camp_directors

  end
end
