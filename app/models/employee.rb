class Employee < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone, presence: true, format: { with: /\A\+?\d{10,14}\z/, message: "must be a valid phone number" }
  end