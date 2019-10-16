# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bparty = Party.create(name: "B Party", description: "Kai's 7th birthday party", location: "x-trampoline park", date_time: DateTime.strptime("09/28/2019 12:00", "%m/%d/%Y %H:%M"), dress_code: "comfortable pants and shirts")

kai = Host.create(name: "Kai")

bparty.host = kai