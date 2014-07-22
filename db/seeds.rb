# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Location.create name: 'Home', city: '', description: 'The place where I live', zip_code: "08340", street: "Urgell", country: "Spain"
Location.create name: 'Work', city: 'Barcelona'
Location.create name: 'MOB', city: 'Barcelona'