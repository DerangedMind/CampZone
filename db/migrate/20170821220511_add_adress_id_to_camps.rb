class AddAdressIdToCamps < ActiveRecord::Migration[5.0]
  def change
    remove_column :addresses, :camp_id, :integer
    add_column :camps, :address_id, :integer
  end
end
