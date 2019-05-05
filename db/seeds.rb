# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.where(role: 'consultant').where.not(id: 4).destroy_all
Faker::Config.locale = 'ru'
I18n.reload!
30.times do |t|
  params = {
    user: {
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password',
      role: 'consultant'
    }
  }

  u = User::Create.call(params: params)[:model]

  if t.odd?
    gender = 'male'
    name = Faker::Name.male_first_name
    middle_name = Faker::Name.male_middle_name
    surname = Faker::Name.male_last_name
  else
    gender = 'female'
    name = Faker::Name.female_first_name
    middle_name = Faker::Name.female_middle_name
    surname = Faker::Name.female_last_name
  end

  birthday = Faker::Date.between(70.years.ago, 25.years.ago)
  descr = Faker::Lorem.paragraph_by_chars(100, false)

  ConsultantProfile::Update.call(
    params: {
      consultant_profile: {
        name: name,
        middle_name: middle_name,
        surname: surname,
        birthday: birthday,
        gender: gender,
        description: descr
      }
    },
    current_user: u
  )
end
