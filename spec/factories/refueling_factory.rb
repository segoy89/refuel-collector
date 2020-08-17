# frozen_string_literal: true

FactoryBot.define do
  factory :refueling, class: Refueling do
    liters                  { 10 }
    kilometers              { 100 }
    cost                    { 40 }
    avg_fuel_consumption    { 5 }
    note                    { 'Simple note' }

    association :user
  end
end
