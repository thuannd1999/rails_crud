class Restaurant < ApplicationRecord
  has_many :dishes

  validates :name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
  validates :address, presence: true, format: { with: /\A[\w\s]+\z/, message: "only allows letters, numbers, and spaces" }
end
