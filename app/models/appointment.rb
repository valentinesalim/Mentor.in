class Appointment < ApplicationRecord
  belongs_to :event
  belongs_to :requester, class_name: "User"
  has_many :reviews, dependent: :destroy
end
