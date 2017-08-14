# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'openssl'

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/dist/img/#{file_name}"))
end

SuperAdmin.create!(email: 'sadmin@cvs.com', password: '123456', password_confirmation: '123456', img: seed_image('avatar5.png'))
puts('SuperAdmin Created')
Type.create(name: 'Medical')
Type.create(name: 'Legal')
Type.create(name: 'General')

Plan.create!(name: "Silver", amount: 100.00, period: 6, number_of_lines: 2000, size_of_files: 200, number_of_users: 1, number_of_files: 2)
Plan.create!(name: "Gold", amount: 200.00, period: 6, number_of_lines: 4000, size_of_files: 400, number_of_users: 5, number_of_files: 4)
Plan.create!(name: "Platinum", amount: 500.00, period: 6, number_of_lines: 8000, size_of_files: 800, number_of_users: 10, number_of_files: 8)
#
puts('Types Created')
n = rand(5..20)
i=0
n.times do
  admin = Admin.new(email: "admin#{i}@cvs.com", password: '123456', password_confirmation: '123456', img: seed_image("avatar#{rand(1..5)}.png"))
  # admin.skip_confirmation!
  admin.save!
  Business.create!(name: Faker::Company.name, approved: false, admin: admin, type_id: rand(1..3), plan_id: rand(1..3))
  i=i+1
  u = rand(1..admin.business.plan.number_of_users)
  u.times do
    admin.create_user(email: "user.#{admin.business.name}@cvs.com", password: '123456', password_confirmation: '123456')
  end
end
