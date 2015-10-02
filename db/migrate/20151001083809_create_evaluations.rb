class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.integer :rate, null: false
      t.text :comment
      t.references :source_profile, index: true, foreign_key: false, null: false
      t.references :target_profile, index: true, foreign_key: false, null: false

      t.timestamps null: false
    end
  end
end
