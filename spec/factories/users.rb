# frozen_string_literal: true

require 'faker'
current_password = Faker::Internet.password(min_length: 8) 
FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    nickname { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { current_password }
    password_confirmation { current_password }
  end
end
