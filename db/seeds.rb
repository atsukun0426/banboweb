# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "サンプル", email: "sample@gmail.com", password: "sample123", password_confirmation: "sample123")
User.create!(name: "サンプル2", email: "sample2@gmail.com", password: "sample1234", password_confirmation: "sample1234")
