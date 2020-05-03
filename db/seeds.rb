# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: 'test@test.com',
    password: 'testtest'
    )

Customer.create!(
    first_name: 'test',
    last_name: 'customer',
    kana_first_name: 'テスト',
    kana_last_name: 'カスタマー',
    postcode: 1234567,
    address: '東京都品川区',
    email: "customer@test.com",
    password:              "customer",
    password_confirmation: "customer")