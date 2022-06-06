# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true
end
