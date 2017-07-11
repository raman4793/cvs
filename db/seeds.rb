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
puts('Types Created')
n = rand(5..20)
i=0
n.times do
  admin = Admin.new(email: "admin#{i}@cvs.com", password: '123456', password_confirmation: '123456', img: seed_image("avatar#{rand(1..5)}.png"))
  admin.skip_confirmation!
  admin.save!
  Business.create!(name: Faker::Company.name, approved: false, admin: admin, type: Type.find(rand(1..3)))
  i=i+1
end

puts('Admin and Business Created')

