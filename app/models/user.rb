class User < ApplicationRecord
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true

  enum role: { receptionist: "receptionist", doctor: "doctor" }
end
