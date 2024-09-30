class Patient < ApplicationRecord
  # Validations (optional)
  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :contact_info, presence: true
  validates :address, presence: true
end
