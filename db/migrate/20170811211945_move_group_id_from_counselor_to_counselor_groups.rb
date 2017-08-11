class MoveGroupIdFromCounselorToCounselorGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :counselors, :group_id

    create_join_table :counselors, :groups
  end
end
