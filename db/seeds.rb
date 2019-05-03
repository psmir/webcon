# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.where(role: 'consultant').where.not(id: 4).destroy_all

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

  descr = Faker::Lorem.paragraph_by_chars(100, false)

  ConsultantProfile::Update.call(
    params: {
      consultant_profile: {
        description: descr
      }
    },
    current_user: u
  )
end
