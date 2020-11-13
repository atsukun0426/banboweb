class Recruitment < ApplicationRecord
  belongs_to :user
  belongs_to :organizer
  has_many :requests
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
end
