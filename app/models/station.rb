class Station < ApplicationRecord
  validates_uniqueness_of :crscode
  has_many :visits
  belongs_to :operator, counter_cache: :stations_count

  def visit_type_string
  end
end
