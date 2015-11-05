class AddGenderAvatarToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :gender, :integer, :limit => 1
	  add_attachment :profiles, :avatar
    add_attachment :items, :picture
  end
end
