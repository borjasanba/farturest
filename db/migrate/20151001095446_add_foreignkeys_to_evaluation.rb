class AddForeignkeysToEvaluation < ActiveRecord::Migration
  def change
    add_foreign_key :evaluations, :profiles, column: :source_profile_id
    add_foreign_key :evaluations, :profiles, column: :target_profile_id
  end
end
