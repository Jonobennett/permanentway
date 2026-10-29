class Region < ApplicationRecord
  include Progress
  validates :name, presence: true, uniqueness: true
  has_many :stations

  def visit_count
    Current.user.stations.where(region_id: self.id).count
  end

  private
    def max_levels
      Current.user.visits.joins(:station).where(stations: { region_id: self.id }).group("station_id").maximum("visit_type")
    end

    def station_count
      self.stations_count
    end
end
