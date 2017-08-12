# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Camp.destroy_all

camp = Camp.create!(
  name: Faker::HarryPotter.location,
  address: '123 Magic Lane',
  phone_number: '5551234567'
)

Group.destroy_all

group = Group.create!({
  camp_id: camp.id,
  name: Faker::StarTrek.location,
  min_age: 12,
  max_age: 14,
  start_date: Date.current.next_week(:monday)
})

User.destroy_all

director_user = User.create!({
  first_name: Faker::Zelda.character,
  last_name: "of #{Faker::Zelda.location}",
  email: "admin@couchlyfe.com",
  password: BCrypt::Password.create('password'),
  role: "director"
})

director = Director.create!({
  user_id: director_user.id,
  camp_ids: [camp.id]
})

acc_status = ["inactive", "active", "pending"]

3.times do |count|
  user = User.create!({
    first_name: Faker::Zelda.character,
    last_name: "of #{Faker::Zelda.location}",
    email: "#{Faker::Cat.name}@campers.com",
    password: BCrypt::Password.create('password'),
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

10.times do |count|
  user = User.create!({
    first_name: Faker::Lovecraft.deity,
    last_name: "of #{Faker::Lovecraft.location}",
    email: "#{Faker::Lovecraft.word}#{count * rand(7) + 1}@campers.com",
    password: BCrypt::Password.create('password'),
    role: "parent"
  })
end


