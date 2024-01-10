# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by(email: 'admin@gmail.com', name: 'Admin', role: 'admin') { |user| user.password = 't3ch123-' }

plan = Plan.find_or_create_by(user_id: 1, name: 'opo', monthly_fee: 98)

plan.features.find_or_create_by(name: '30gb', unit_price: 30, max_unit_limit: 10, code: 'o0o18')
