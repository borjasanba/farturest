class Item < ActiveRecord::Base
  belongs_to :profile

  has_attached_file :picture, :path => ":rails_root/public/pictures/:id/:style/:basename.:extension",
  :url => "/pictures/:id/:style/:basename.:extension",
  :default_url => "/pictures/missing.png",
  :styles => { :thumb => "300x300" }
  #,:size => { :in => 0..1.megabytes },
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def picture_url
	   picture.url(:original)
  end
end
