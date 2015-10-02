class Evaluation < ActiveRecord::Base
  belongs_to :source_profile, :class_name => 'Profile', :foreign_key => 'source_profile_id'
  belongs_to :target_profile, :class_name => 'Profile', :foreign_key => 'target_profile_id'
end
