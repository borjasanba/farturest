class AddColumnsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :age, :integer
    add_column :profiles, :speciality, :string
    change_column_null :profiles, :user_id, false
  end
end
