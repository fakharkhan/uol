class Category < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates :name,:presence => true
  validates :avatar, :attachment_presence => true



  def avatar_url_thumb
    avatar.url(:thumb)
  end
  def avatar_url_medium
    avatar.url(:medium)
  end
end
