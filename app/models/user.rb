# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules.
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  validates :email, :nickname, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nickname, uniqueness: true

  before_validation :set_provider
  before_validation :set_uid

  def set_provider
    self[:provider] = "email" if self[:provider].blank?
  end

  def set_uid
    self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
  end
end
