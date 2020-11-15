class UserRoom < ApplicationRecord
  belongs_to :user
  #belongs_to :organizer
  belongs_to :room
end
