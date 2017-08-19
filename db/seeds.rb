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
    email: "#{Faker::Cat.name}#{rand(6)}@campers.com",
    password: "password",
    role: "counselor"
  })

  counselor = Counselor.create!({
    user_id: user.id,
    alias: Faker::Pokemon.name,
    training: false,
    account_status: acc_status[count],
    group_ids: [group.id]
  })
end

puts "Creating Test Counselor..."

test_counselor_user = User.create(
  first_name: 'Test Counselor',
  last_name: "TEST",
  email: "counselor@campzone.com",
  password: "password",
  role: "counselor"
)

test_counselor = Counselor.create(
  user_id: test_counselor_user.id,
  alias: "DemiGodMode",
  training: true,
  account_status: "active",
  group_ids: [group.id]
)


Parent.destroy_all
Kid.destroy_all
puts "Creating Parents and Kids..."

10.times do |count|
  user = User.create!({
    first_name: Faker::Lovecraft.deity,
    last_name: "of #{Faker::Lovecraft.location}",
    email: "#{Faker::Lovecraft.word}#{count * rand(7) + 1}@campers.com",
    password: "password",
    role: "parent"
  })

  address = Address.create!({
    city: Faker::Address.city,
    province: Faker::Address.state_abbr,
    country: Faker::Address.country,
    street_address: Faker::Address.street_address,
    apt_number: Faker::Address.secondary_address,
    postal_code: Faker::Address.postcode.to_s
  })

  parent = Parent.create!({
    user_id: user.id,
    address_id: address.id,
    phone_number: Faker::PhoneNumber.phone_number
  })

  random = 1 + rand(3)
  random.times do |count|
    kid = Kid.create!({
      first_name: Faker::Pokemon.name,
      last_name: "of #{Faker::HarryPotter.location}",
      birthdate: Faker::Date.birthday(5, 14),
      sin: Faker::Number.number(9)
    })
    KidsParent.create!({
      parent_id: parent.id,
      kid_id: kid.id
    })
    MedicalInfo.create({
      kid_id: kid.id,
      allergies: Faker::Witcher.monster,
      conditions: Faker::Lorem.word,
      medications: "Some kind of medication lol",
      dietary_restrictions: "Can't eat food",
      epi_pen: true,
      medicare: Faker::Number.number(12)
      })
    GroupsKid.create!({
      kid_id: kid.id,
      group_id: 1
    })
  end
end

puts "Creating Test Parent..."

test_parent_user = User.create(
  first_name: "TestParent",
  last_name: "TEST",
  email: "parent@campzone.com",
  password: "password",
  role: "parent"
)

test_parent = Parent.create(
  user_id: test_parent_user.id,
  address_id: Parent.find(KidsParent.find_by_kid_id(3).parent_id).address_id,
  phone_number: "5141234567"
)

# find address through prent.
# find prent with kid id 3

KidsParent.create(
  parent_id: test_parent.id,
  kid_id: 3
)
