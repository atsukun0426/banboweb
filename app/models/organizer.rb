class Organizer < ApplicationRecord
  mount_uploader :image, ImagesUploader
  has_many :recruitments, dependent: :destroy
  has_many :user_rooms
  has_many :chats
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :description, length: { maximum: 200 }
end
