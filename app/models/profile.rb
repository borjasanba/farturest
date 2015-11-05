class Profile < ActiveRecord::Base
  belongs_to :user

  validates :age, :inclusion => 18..99
  validates :user_id, presence: true
  validates :name, length: {maximum: 255}
  validates :speciality, length: {maximum: 255}

  has_attached_file :avatar, :path => ":rails_root/public/avatars/:id/:style/:basename.:extension",
  :url => "/avatars/:id/:style/:basename.:extension",
  :default_url => "/avatars/missing.png",
  :styles => { :thumb => "300x300" },
  :size => { :in => 0..1.megabytes }
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def avatar_url
	   avatar.url(:original)
  end

  def num_evaluations
    Evaluation.where(target_profile_id: self.id).count(:all)
  end

  def num_items
    Item.where(profile_id: self.id).count(:all)
  end
end
