class User < ApplicationRecord
  mount_uploader :image, ImagesUploader
  has_many :posts, dependent: :destroy
  has_many :recruitments, dependent: :destroy
  has_many :comments
  has_many :user_rooms
  has_many :chats
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true
  validates :description, length: { maximum: 200 }

  def self.from_omniauth(auth)
    where(uid: auth.uid).first
  end

  def self.new_with_session(_, session)
    super.tap do |user|
      if (data = session['devise.omniauth_data'])
        user.email = data['email'] if user.email.blank?
        user.provider = data['provider'] if data['provider'] && user.provider.blank?
        user.uid = data['uid'] if data['uid'] && user.uid.blank?
        user.skip_confirmation!
      end
    end
  end
end
