class CreateItemLocation < ActiveRecord::Migration
  def change
    create_table :item_location do |t|
      t.references :item, index: true, foreign_key: true, null: false
      t.integer :capacity, null: false
      t.datetime :date_finish, null: false
      t.decimal :latitude, :precision => 15, :scale => 10, null: false
      t.decimal :longitude, :precision => 15, :scale => 10, null: false

    end

    add_index :item_location, :latitude
    add_index :item_location, :longitude
    add_index :item_location, [:latitude, :longitude]
  end
end
