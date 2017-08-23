class UpdateCampsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :camps, :address, :string
  end
end