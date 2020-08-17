# frozen_string_literal: true

class AvgFuelConsumption
  def initialize(liters:, kilometers:)
    @liters     = liters
    @kilometers = kilometers
  end

  def count
    return unless Float(liters, exception: false) && Float(kilometers, exception: false)

    count_avg_fuel_consumption
  end

  private

  attr_reader :liters, :kilometers

  def count_avg_fuel_consumption
    (liters.to_f * 100 / kilometers.to_f).round(2)
  end
end
