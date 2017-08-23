class ChangeMedicareField < ActiveRecord::Migration[5.0]
  def change
    remove_column :kids, :medicare, :string
    add_column :medical_infos, :medicare, :string
  end
end
