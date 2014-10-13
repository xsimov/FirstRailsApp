# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

Location.create name: 'Home', city: 'Vilassar de Mar', description: 'The place where I live', zip_code: "08340", street: "Lullaby, 32", country: "Spain"
Location.create name: 'Work', city: 'Barcelona', description: 'The place where I make money', zip_code: "08008", street: "Mercadal, 1", country: "Spain"
Location.create name: 'MOB', city: 'Barcelona', description: 'The place where I learn coding', zip_code: "08015", street: "Bailèn, 11", country: "Spain"

Visit.create user_id: 1, from_date: (Time.now + 1.week), to_date: (Time.now + 8.weeks), location_id: 3, user_id: 1
Visit.create user_id: 2, from_date: (Time.now + 4.month), to_date: (Time.now + 2.month), location_id: 2, user_id: 2
Visit.create user_id: 3, from_date: (Time.now + 1.month), to_date: (Time.now + 2.year), location_id: 1, user_id: 3
Visit.create user_id: 1, from_date: (Time.now + 1.year), to_date: (Time.now + 1.year + 1.week), location_id: 2, user_id: 1

User.create username: "smitfire", firstname: "Nick", lastname: "Smit"
User.create username: "darioc", firstname: "Dario", lastname: "Cavanillas"
User.create username: "elreplicante", firstname: "Sergio", lastname: "Revilla"
User.create username: "kikobeats", firstname: "Kiko", lastname: "Beats"