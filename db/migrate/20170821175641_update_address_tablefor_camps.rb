class UpdateAddressTableforCamps < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :camp_id, :integer
  end
end
