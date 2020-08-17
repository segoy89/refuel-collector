# frozen_string_literal: true

class FuelReflex < ApplicationReflex
  def avarage
    puts refueling_params
    avg_fuel_consumption = AvgFuelConsumption.new(
        liters:     refueling_params[:liters],
        kilometers: refueling_params[:kilometers]
      ).count
    avg_fuel_consumption ||= '0.00'

    morph '#avg_fuel_consumption', avg_fuel_consumption
  end

  private

  def refueling_params
    params.require(:refueling).permit(:liters, :kilometers)
  end
end
