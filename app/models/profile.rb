class Profile < ActiveRecord::Base
  belongs_to :user
  validates :age, :inclusion => 18..99
  validates :user_id, presence: true
  validates :name, length: {maximum: 255}
  validates :speciality, length: {maximum: 255}

end
