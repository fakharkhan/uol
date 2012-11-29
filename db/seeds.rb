# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating Store Categories........"

Item.delete_all
Unit.delete_all
Category.delete_all
Category.create([
                    {name: 'Apparel: Children'},
                    {name: 'Apparel: Men'},
                    {name: 'Apparel: Women'},
                    {name: 'Athletic Wear & Sporting Goods'},
                    {name: 'Books & Music'},
                    {name: 'Cards & Gifts'},
                    {name: 'Department Stores'},
                    {name: 'Electronics & Computers'},
                    {name: 'Furniture'},
                    {name: 'Health & Beauty'},
                    {name: 'Home & Kitchen'},
                    {name: 'Jewellery'},
                    {name: 'Leather Goods & Luggage '},
                    {name: 'Movies'},
                    {name: 'Photography '},
                    {name: 'Restaurants & Food'},
                    {name: 'Services '},
                    {name: 'Toys & Hobbies  '}
                ])

Unit.create([
                    {name: 'NUMBER'},
                    {name: 'KILOGRAM'},
                    {name: 'BOX'},
                    {name: 'METER'}
                ])
