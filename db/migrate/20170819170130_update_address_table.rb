class UpdateAddressTable < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :province
      t.string :country
      t.string :street_address
      t.string :apt_number
      t.string :postal_code

      t.timestamps
    end

    remove_column :parents, :address, :string
    add_column :parents, :address_id, :integer
  end
end
