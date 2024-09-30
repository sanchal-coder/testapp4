# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

Patient.create([
  { name: "Rahul Sharma", age: 30, contact_info: "9876543210", address: "123, MG Road, Bengaluru, Karnataka", created_at: "2024-09-01" },
  { name: "Anita Verma", age: 25, contact_info: "9123456789", address: "456, Brigade Road, Bengaluru, Karnataka", created_at: "2024-09-02" },
  { name: "Vikram Singh", age: 40, contact_info: "9988776655", address: "789, Jayanagar, Bengaluru, Karnataka", created_at: "2024-09-03" },
  { name: "Priya Patel", age: 28, contact_info: "8765432109", address: "321, Indiranagar, Bengaluru, Karnataka", created_at: "2024-09-04" },
  { name: "Kiran Gupta", age: 35, contact_info: "9988771234", address: "654, Koramangala, Bengaluru, Karnataka", created_at: "2024-09-05" },
  { name: "Sneha Reddy", age: 22, contact_info: "9876543210", address: "987, Whitefield, Bengaluru, Karnataka", created_at: "2024-09-06" },
  { name: "Rajesh Kumar", age: 45, contact_info: "9898989898", address: "111, Malleshwaram, Bengaluru, Karnataka", created_at: "2024-09-07" },
  { name: "Deepa Nair", age: 33, contact_info: "9966554433", address: "222, HSR Layout, Bengaluru, Karnataka", created_at: "2024-09-08" },
  { name: "Amit Joshi", age: 29, contact_info: "9777888999", address: "333, Bellandur, Bengaluru, Karnataka", created_at: "2024-09-09" },
  { name: "Sonia Mehta", age: 31, contact_info: "9666777888", address: "444, Ulsoor, Bengaluru, Karnataka", created_at: "2024-09-10" }
])
User.create(email: "receptionist@example.com", password: "password", role: :receptionist)
User.create(email: "doctor@example.com", password: "password", role: :doctor)
