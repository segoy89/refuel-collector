class Refueling < ApplicationRecord
  belongs_to :user

  with_options numericality: { greater_than: 0 } do
    validates :liters,     presence: true
    validates :kilometers, presence: true
    validates :cost,       allow_nil: true
  end
end
