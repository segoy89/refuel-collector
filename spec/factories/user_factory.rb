# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    name                    { 'Johny' }
    password                { 'password' }
    password_confirmation   { 'password' }
    confirmed_at            { Date.current }

    sequence(:email) { |n | "john.doe#{n}@example.com" }
  end
end
