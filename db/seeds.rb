# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Account.create!(name:  "admin",
             email: "admin@example.com",
             password:              "abc321",
             password_confirmation: "abc321",
             is_admin: true,
             activated: true,
             activated_at: Time.zone.now)

Account.create!(name:  "user",
             email: "user@example.com",
             password:              "abc321",
             password_confirmation: "abc321",
             is_admin: false,
             activated: true,
             activated_at: Time.zone.now)