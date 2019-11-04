# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#require 'database_cleaner' #permet de réinitialiser la base à chaque relance du seed

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

10.times do
	fname=Faker::Name.first_name
	lname=Faker::Name.last_name
	User.create(email:fname+"."+lname+"@yopmail.com", first_name:fname , last_name:lname )
end
puts "Users created"


10.times do
	Event.create(start_date:Time.now, duration:(5*rand(1..10)) , title:Faker::Movies::StarWars.planet, description:Faker::Quote.yoda, price: rand(1..1000),location:Faker::Address.city, user_id:User.find(rand(1..10)).id)
end
puts "Event created"

10.times do
	Participation.create(event_id:Event.find(rand(1..10)).id , user_id:User.find(rand(1..10)).id )
end
puts "Participation created"
