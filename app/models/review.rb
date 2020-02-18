class Review < ApplicationRecord
  
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 500 } 
  validates :point, presence: true
  validates :image, presence: true
  
  belongs_to :user
  belongs_to :spot
  
mount_uploader :image, ImageUploader


  
end
