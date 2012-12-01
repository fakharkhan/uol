class Item < ActiveRecord::Base
  belongs_to :unit   ,:dependent => :destroy
  belongs_to :category ,:dependent => :destroy
  attr_accessible :active, :name, :short_name ,:unit_id, :category_id ,:description

  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates :name,:presence => true


  validates :avatar, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :avatar

  def avatar_url_thumb
    avatar.url(:thumb)
  end
  def avatar_url_medium
    avatar.url(:medium)
  end
  def avatar_url_original
    avatar.url
  end
end
