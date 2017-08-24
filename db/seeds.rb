# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Camp.destroy_all
User.destroy_all
Counselor.destroy_all
Director.destroy_all
Group.destroy_all
Parent.destroy_all
Kid.destroy_all

Faker::Config.locale = 'en-CA'

def create_address
  address = Address.create!({
    city: Faker::Address.city,
    province: Faker::Address.state_abbr,
    country: Faker::Address.country,
    street_address: Faker::Address.street_address,
    apt_number: Faker::Address.secondary_address,
    postal_code: Faker::Address.postcode.to_s
  })
end

def create_director_user
  user = User.create!({
    first_name: Faker::DragonBall.character,
    last_name: Faker::Cat.name,
    email: "admin#{rand(4 * 12) + 1}@couchlyfe.com",
    password: "password",
    role: "director",
    email_confirmed: true,
    confirm_token: nil
  })
end

def create_director(user)
  director = Director.create!({
    user_id: user.id
  })
end

def create_counselor_user
  user = User.create!({
    first_name: Faker::Zelda.character,
    last_name: Faker::Cat.name,
    email: "#{Faker::Cat.name}#{rand(5..50)}#{rand(1..8)}#{rand(5..10)}@campers.com",
    password: "password",
    role: "counselor",
    email_confirmed: true,
    confirm_token: nil
  })
end

def create_counselor(user, group, acc_status)
  counselor = Counselor.create!({
    user_id: user.id,
    alias: Faker::Pokemon.name,
    training: false,
    account_status: acc_status,
    group_ids: [group.id]
  })
end

def create_parent_user
  user = User.create!({
    first_name: Faker::Lovecraft.deity,
    last_name: Faker::Witcher.monster,
    email: "#{Faker::Hipster.word}#{rand(5..50)}#{rand(1..8)}#{rand(5..10)}@campers.com",
    password: "password",
    role: "parent",
    email_confirmed: true,
    confirm_token: nil
  })
end

def create_parent(user, address)
  parent = Parent.create!({
    user_id: user.id,
    address_id: address.id,
    phone_number: Faker::Base.numerify('(###)###-####')
  })
end

def create_kid(parent, group_id)
  kid = Kid.create!({
    first_name: Faker::Color.color_name.capitalize,
    last_name: Faker::Pokemon.name,
    birthdate: Faker::Date.birthday(8, 17),
    sin: Faker::Number.number(9),
    parent_ids: parent.id,
    group_ids: group_id
  })
end

def create_medical(kid)
  medical = MedicalInfo.create({
    kid_id: kid.id,
    allergies: Faker::Witcher.monster,
    conditions: Faker::Lorem.word,
    medications: "Some kind of medication lol",
    dietary_restrictions: "Can't eat food",
    epi_pen: [true, false].sample,
    medicare: Faker::Number.number(12)
  })
end

def create_camp(director, address)
  camp = Camp.create!(
    name: Faker::HarryPotter.location,
    address_id: address.id,
    phone_number: Faker::Base.numerify('(###)###-####'),
    director_id: director.id
  )
end

def create_group(camp, age)
  group = Group.create!({
    camp_id: camp.id,
    name: Faker::StarTrek.location,
    min_age: age,
    max_age: age+2,
    start_date: Faker::Date.between(1.month.from_now, 6.months.from_now)
  })

end

def calculate_age(kid)
  unless kid.birthdate.nil?
    current_date = Date.today
    age = ((current_date - kid.birthdate).to_i) / 365
    return age
  end
end

4.times do |main_count|

  puts "Creating Director..."
  director = create_director(create_director_user)

  puts "Creating Camp..."
  camp = create_camp(director, create_address)

  puts "Creating Groups..."
  age = 8
  groups = []
  4.times do
    groups << create_group(camp, age)
    age += 3
  end

  acc_status = ["inactive", "active", "pending"]

  puts "Creating Counselors..."

  12.times do |counselor_count|
    counselor = create_counselor(create_counselor_user, groups[counselor_count % 4], acc_status[counselor_count % 3])
  end

  puts "Creating Parents and Kids..."

  20.times do |parent_count|
    parent = create_parent(create_parent_user, create_address)

    random = 1 + rand(3)
    random.times do |kid_count|
      kid = create_kid(parent, ((parent_count % 3) * main_count) + 1)
      create_medical(kid)
      age = calculate_age(kid)
      kid.groups << Group.where("min_age <= ? AND max_age >= ? AND camp_id = ?", age, age, camp.id)

    end
  end
end

puts "Creating Test Counselor..."

test_director_user = User.create!(
  first_name: 'Grandma',
  last_name: "Testerson",
  email: "admin@couchlyfe.com",
  password: "password",
  role: "director",
  email_confirmed: true,
  confirm_token: nil
)

test_counselor_user = User.create!(
  first_name: 'Test Counselor',
  last_name: "TEST",
  email: "counselor@campzone.com",
  password: "password",
  role: "counselor",
  email_confirmed: true,
  confirm_token: nil
)

test_counselor = Counselor.create!(
  user_id: test_counselor_user.id,
  alias: "DemiGodMode",
  training: true,
  account_status: "active",
  group_ids: [1, 8]
)

puts "Creating Test Parent..."

test_parent_user = User.create!(
  first_name: "TestParent",
  last_name: "TEST",
  email: "parent@campzone.com",
  password: "password",
  role: "parent",
  email_confirmed: true,
  confirm_token: nil
)

test_parent = Parent.create!(
  user_id: test_parent_user.id,
  address_id: Parent.find(KidsParent.find_by_kid_id(3).parent_id).address_id,
  phone_number: "5141234567"
)

test_parent.kids << Kid.find(3)
