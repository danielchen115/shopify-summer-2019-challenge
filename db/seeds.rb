# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create!([{
                   title: "Captain America's Shield",
                   price: 2999.99,
                   inventory_count: 1
                 },
                 {
                   title: "Hawkeye's Exploding Arrows",
                   price: 19.99,
                   inventory_count: 219
                 },
                 {
                     title: "Hawkeye's Exploding Arrows",
                     price: 19.99,
                     inventory_count: 181
                 },
                 {
                     title: "Iron Man's Suit",
                     price: 9999.99,
                     inventory_count: 2
                 },
                 {
                     title: "Nick Fury's Eyepatch",
                     price: 49.99,
                     inventory_count: 94
                 },
                 {
                     title: "Thor's Hammer",
                     price: 4999.99,
                     inventory_count: 0
                 }])

p "Created #{Product.count} products"