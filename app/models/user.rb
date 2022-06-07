# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, :username, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, :username, uniqueness: true
end
