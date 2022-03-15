namespace :db do

desc "populates the database with videos"
  task populate: :environment do
	5.times do
	  Video.create!(
	   name: Faker::Movie.title,
	   description: Faker::Lorem.paragraph, 
	   thumbnail: Faker::Avatar.image, 
	   rent_price: Faker::Number.decimal(l_digits: 2), 
	   user_id: Faker::Number.between(from: 1, to: 3) 
	  )
	end
   end
end
