class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :images, presence: true

    def resized_images
        images.map do |image|
          image.variant(resize_to_limit: [800, 800]).processed
        end 
    end

    def liked_by?(user)
      likes.exists?(user: user)
    end 

    def like_count 
      likes.count
    end
end
