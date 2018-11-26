# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Generate 24 values for both currencies
%w(USD EUR).each do |currency|
  (1..24).each do |n|
    CurrencyRate.create(buy: rand(66.0..67.5), sell: rand(68.0..69.5), currency: currency, created_at: DateTime.now - n.hours)
  end
end
