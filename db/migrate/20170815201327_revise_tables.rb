class ReviseTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :kids_parents

    create_join_table :kids, :parents
    create_join_table :kids, :groups
  end
end
