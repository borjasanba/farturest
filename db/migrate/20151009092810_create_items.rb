class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :profile, index: true, foreign_key: true, null: false
	  t.references :category, index: true, foreign_key: true, null: false
      t.string :text_short, null: false
      t.text :text_long
	  t.decimal :price, :precision => 3, :scale => 2, null: false
    end

  end
end
