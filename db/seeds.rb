# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

director = User.create!(
  first_name: Faker::Zelda.character,
  last_name: "of #{Faker::Zelda.location}",
  email: "admin@couchlyfe.com",
  password_digest: BCrypt::Password.create('password'),
  role: "director"
)

acc_status = ["inactive", "active", "pending"]

3.times do |count|
  user = User.create!(
    first_name: Faker::Zelda.character,
    last_name: "of #{Faker::Zelda.location}",
    email: "#{Faker::Cat.name}@campers.com",
    password_digest: BCrypt::Password.create('password'),
    role: "counselor"
  )

  counselor = Counselor.create!(
    user_id: user.id,
    alias: Faker::Pokemon.name,
    training: false,
    account_status: acc_status[count]
  )
end

10.times do |count|
  user = User.create!(
    first_name: Faker::Lovecraft.deity,
    last_name: "of #{Faker::Lovecraft.location}",
    email: "#{Faker::Lovecraft.word}@campers.com",
    password_digest: BCrypt::Password.create('password'),
    role: "parent"
  )
end


