# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Camp.destroy_all

puts "Creating Camp..."

camp = Camp.create!(
  name: Faker::HarryPotter.location,
  address: '123 Magic Lane',
  phone_number: '5551234567'
)

puts "Creating Group..."

Group.destroy_all

group = Group.create!({
  camp_id: camp.id,
  name: Faker::StarTrek.location,
  min_age: 12,
  max_age: 14,
  start_date: Date.current.next_week(:monday)
})

puts "Creating Director..."

User.destroy_all
Counselor.destroy_all
Director.destroy_all

director_user = User.create!({
  first_name: Faker::Zelda.character,
  last_name: "of #{Faker::Zelda.location}",
  email: "admin@couchlyfe.com",
  password: "password",
  role: "director"
})

director = Director.create!({
  user_id: director_user.id,
  camp_ids: [camp.id]
})

acc_status = ["inactive", "active", "pending"]

puts "Creating Counselors..."

3.times do |count|
  user = User.create!({
    first_name: Faker::Zelda.character,
    last_name: "of #{Faker::Zelda.location}",
    email: "#{Faker::Cat.name}@campers.com",
    password: "password",
    role: "counselor",
  })

  counselor = Counselor.create!({
    user_id: user.id,
    alias: Faker::Pokemon.name,
    training: false,
    account_status: acc_status[count],
    group_ids: [group.id]
  })
end

puts "Creating Parents..."
# join tables for parents and kids
# create 1-3 kids per parent
# create parent from user

10.times do |count|
  user = User.create!({
    first_name: Faker::Lovecraft.deity,
    last_name: "of #{Faker::Lovecraft.location}",
    email: "#{Faker::Lovecraft.word}#{count * rand(7) + 1}@campers.com",
    password: "password",
    role: "parent"
  })
end

Kid.destroy_all

puts "Creating Kids..."

2.times do |count|
  kid = Kid.create!({
    first_name: Faker::Superhero.name,
    last_name: "of #{Faker::StarWars.planet}",
    birthdate: Faker::Date.birthday(5, 14),
    sin: Faker::Number.number(9),
    medicare: Faker::Number.number(12)
  })
end
