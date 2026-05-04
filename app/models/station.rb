class Station < ApplicationRecord
  validates :name, presence: :true, uniqueness: true
  validates :crscode, presence: :true, uniqueness: true
  has_many :visits
  belongs_to :operator, counter_cache: :stations_count
  belongs_to :region, counter_cache: :stations_count

  def visited
    false unless authenticated?
  end
end
