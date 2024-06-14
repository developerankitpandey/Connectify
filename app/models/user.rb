class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes
  has_many :messages
  has_many :rooms, through: :messages
  has_many :conversations
  has_one :profile, dependent: :destroy
end
