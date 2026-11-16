class Station < ApplicationRecord
  validates :name, presence: :true, uniqueness: true
  validates :crscode, presence: :true, uniqueness: true
  has_many :visits
  belongs_to :operator, counter_cache: :stations_count
  belongs_to :region, counter_cache: :stations_count

  def visited?
    false unless Current.user
    self.visits.where(user_id: Current.user.id).exists?
  end

  def visit_level
    0 unless Current.user
    self.visits.where(user_id: Current.user.id).maximum("visit_type")
  end

  def map_icon
    strings = {
      1 => "passedIcon",
      2 => "calledAtIcon",
      3 => "changedIcon",
      4 => "gatelineIcon"
    }
    strings[self.visit_level]
  end

  def map_layer
    strings = {
      1 => "passed_through",
      2 => "called_at",
      3 => "changed",
      4 => "gateline"
    }
    strings[self.visit_level]
  end
end
