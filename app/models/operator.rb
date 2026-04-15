class Operator < ApplicationRecord
  validates :code, presence: true, uniqueness: true
  has_many :stations
end
