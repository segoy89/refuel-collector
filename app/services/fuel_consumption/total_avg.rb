# frozen_string_literal: true

module FuelConsumption
  class TotalAvg
    def initialize(user:)
      @user = user
    end

    def count
      count_total_avg
    end

    private

    attr_reader :user
    delegate :refuelings, to: :user, prefix: true

    def count_total_avg
      return 0.0 unless user_refuelings.any?

      (user_refuelings.sum(:liters) * 100 / user_refuelings.sum(:kilometers)).round(2)
    end
  end
end
