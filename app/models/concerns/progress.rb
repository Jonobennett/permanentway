module Progress extend ActiveSupport::Concern
  def visits_breakdown
    breakdown = {
      gateline: 0,
      changed: 0,
      called: 0,
      passed_through: 0
    }
    return breakdown if self.station_count == 0
    self.max_levels.each_value { |level|
      case level
      when 1
          breakdown[:passed_through] += 1
      when 2
          breakdown[:called] += 1
      when 3
          breakdown[:changed] += 1
      when 4
          breakdown[:gateline] += 1
      end
    }
    breakdown.each { |type, count| breakdown[type] = (100 * count.to_f / self.station_count.to_f).truncate(1) }
  end
end
