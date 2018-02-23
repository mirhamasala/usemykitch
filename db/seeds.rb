# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

image = "http://res.cloudinary.com/arnauddlc/image/upload/v1519371097/kitchens/kitchenNUMBER.jpg"

5.times do
	email = Faker::Internet.email
	user = User.new(email: email, password: "passwordtest")
	if user.save
		puts "#{user.email} created and saved"
	end
end
puts "5 users created and saved!"

8.times do
	i = 1
	image_url = image.gsub("NUMBER", i.to_s)
	price = rand(10..150)
	user = User.find(rand(1..5))
	title = Faker::StarWars.character
	description ="Lorem ipsum dolor amet leggings taiyaki jean shorts pabst actually authentic vape green juice PBR&B. Truffaut iPhone actually, stumptown organic before they sold out biodiesel next level sustainable. Offal farm-to-table quinoa shoreditch organic la croix, YOLO air plant etsy. Aesthetic enamel pin taiyaki pok pok. Mlkshk listicle keytar vexillologist. Franzen thundercats ugh affogato pug, tilde deep v meditation pork belly taxidermy synth. Adaptogen echo park hell of squid affogato vaporware banjo af. Vice af portland venmo tumeric gluten-free cardigan pork belly tattooed."
	address = Faker::Address.street_address + " " + Faker::Address.city
	new_kitchen = Kitchen.new(user: user, price: price, picture: image_url, address: address, title: title, description: description )
	if new_kitchen.save
		puts "#{new_kitchen.title} has been created and saved"
	end
	i += 1
end
puts "8 kitchens have been created and saved!"