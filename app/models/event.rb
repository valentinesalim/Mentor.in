class Event < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_one_attached :photo

  $categories = ["Business", "Design", "Technology"]
  $difficulties = ["Beginner", "Medium", "Difficult", "Expert"]
end
