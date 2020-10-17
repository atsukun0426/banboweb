class Apply < ApplicationRecord
  belongs_to :post
  has_many :user
end
