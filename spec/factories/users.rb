# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    username { Faker::Name.unique.name }
    email { Faker::Internet.email }
  end
end
