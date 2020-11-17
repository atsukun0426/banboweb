class Recruitment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  #belongs_to :organizer
  has_many :requests
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }

  def self.search(search)
    return Recruitment.all unless search
    Recruitment.where(['title LIKE ?', "%#{search}%"])
  end
end
