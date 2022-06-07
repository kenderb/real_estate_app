# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email, :username, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, :username, uniqueness: true
end
