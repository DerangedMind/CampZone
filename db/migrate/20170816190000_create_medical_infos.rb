class CreateMedicalInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_infos do |t|
      t.integer :kid_id
      t.text :allergies
      t.text :conditions
      t.text :medications
      t.text :dietary_restrictions
      t.boolean :epi_pen

      t.timestamps
    end
  end
end
