class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :images

    validates :images, presence: true
    
    def resized_images
        images.map do |image|
          image.variant(resize_to_limit: [800, 800]).processed
        end 
    end
end
