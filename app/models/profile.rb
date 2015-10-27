class Profile < ActiveRecord::Base
  belongs_to :user
  validates :age, :inclusion => 18..99
  validates :user_id, presence: true
  validates :name, length: {maximum: 255}
  validates :speciality, length: {maximum: 255}

  has_attached_file :avatar, :path => ":rails_root/public/avatars/:id/:filename",
  :url => "/avatars/:id/:filename", 
  :default_url => "/avatars/missing.png"
  #,:size => { :in => 0..1.megabytes },
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/octet-stream"]

  def avatar_url
	   avatar.url(:original)
  end
end
