# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

r1 = Role.create({ name: 'Staff User', description: 'Can perform CRUD on Videos.' })
r2 = Role.create({ name: 'Admin User', description: 'Can perform CRUD on Videos, can update and destroy any user except super user.' })
r3 = Role.create({ name: 'Super User', description: 'Can perform any CRUD operation on any resource' })
r4 = Role.create({ name: 'Member', description: 'Can read, rent video copies' })

u1 = User.create({ first_name: 'Sally', last_name: 'Christopher', email: 'sally@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r1.id })
u2 = User.create({ first_name: 'Sue', last_name: 'Colby', email: 'sue@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r2.id })
u3 = User.create({ first_name: 'Kev', last_name: 'Cooper', email: 'kev@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r3.id })
u4 = User.create({ first_name: 'Jack', last_name: 'Roberts', email: 'jack@example.com', password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', role_id: r4.id })


v1 = Video.create({ name: 'Ghost Hunters', description: 'Three paranormal investigators investigate hauntings', user_id: u1.id })
v2 = Video.create({ name: 'Alaskan Life', description: 'Documentary about families who live in Alaska', user_id: u2.id })

g1 = Genre.create({ name: 'Action' })
g1 = Genre.create({ name: 'Drama' })
g1 = Genre.create({ name: 'Horror' })
g1 = Genre.create({ name: 'Thriller' })
g1 = Genre.create({ name: 'Science Fiction' })
g1 = Genre.create({ name: 'Adventure' })
g1 = Genre.create({ name: 'Comedy' })

#5.times do
#BusinessCard.create([{name: Faker::name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number}])
#require 'faker'


  videos = Video.create!(
   name: Faker::Movie.title,
   description: Faker::Lorem.paragraph, 
   thumbnail: Faker::Avatar.image, 
   rent_price: Faker::Number.decimal(l_digits: 2), 
   user_id: Faker::Number.between(from: 1, to: 3) 
  )
videos.save

