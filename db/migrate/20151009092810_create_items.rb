class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :profile, index: true, foreign_key: true, null: false
      t.string :text_short, null: false
      t.text :text_long
      t.integer :capacity, null: false
      t.datetime :date_finish, null: false
      t.decimal :latitude, :precision => 15, :scale => 10, null: false
      t.decimal :longitude, :precision => 15, :scale => 10, null: false

      t.timestamps null: false
    end

    add_index :items, :latitude
    add_index :items, :longitude
    add_index :items, [:latitude, :longitude]
  end
end
