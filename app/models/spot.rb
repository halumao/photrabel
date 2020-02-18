class Spot < ApplicationRecord
    
validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
validates :address, presence: true, length: {maximum: 50 }
validates :time_open, presence: true, length: { maximum: 30 }
validates :time_close, presence: true, length: { maximum: 30 }
validates :day_close, presence: true, length: { maximum: 30 }
validates :money, presence: true, length: { maximum: 30 }
validates :prefecture, presence: true
validates :image, presence: true
    mount_uploader :image, ImageUploader
    attr_accessor :average
    has_many :reviews
    belongs_to :user
    
    def self.searchname(search)
       if search
          Spot.where(['name LIKE ?', "%#{search}%"])
       else
           Spot.all
       end
    end
    
    def self.searchpre(search)
       if search
          Spot.where(['prefecture LIKE ?', "%#{search}%"])
       else
           Spot.all
       end
    end
    
    def average_point
       self.reviews.average(:point) 
    end

end
