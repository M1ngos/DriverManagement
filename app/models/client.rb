class Client < ApplicationRecord
  has_many :tasks
  has_many :drivers

  validates :name, presence: true
  validates :contact_info, presence: true
  # validates :address, presence: true
end
