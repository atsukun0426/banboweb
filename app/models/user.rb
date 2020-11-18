class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  mount_uploader :image, ImagesUploader
  mount_uploader :music, AudiofileUploader
  has_many :posts, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  has_many :comments
  has_many :user_rooms
  has_many :chats
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :description, length: { maximum: 200 }

  scope :search, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name]).
      prefecture_id_is(search_params[:prefecture_id])
  end

  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present? }
  scope :prefecture_id_is, -> (prefecture_id) { where(prefecture_id: prefecture_id) if prefecture_id.present? }
  # ここでのself.はUser.を意味する
  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"]) # 検索とnameの部分一致を表示。User.は省略
    else
      all # 全て表示。User.は省略
    end
  end

  def self.from_omniauth(auth)
    where(uid: auth.uid).first
  end
end
