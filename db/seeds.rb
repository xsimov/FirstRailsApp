# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

Location.create name: 'Home', city: 'Vilassar de Mar', description: 'The place where I live', zip_code: "08340", street: "St Joan", country: "Spain"
Location.create name: 'Work', city: 'Barcelona', description: 'The place where I make money', zip_code: "08015", street: "Urgell", country: "Spain"
Location.create name: 'MOB', city: 'Barcelona', description: 'The place where I learn coding', zip_code: "08015", street: "Bailèn", country: "Spain"

Visit.create user_name: "JoseLuis", from_date: (Time.now + 1.week), to_date: (Time.now + 8.weeks), location_id: 3
Visit.create user_name: "Xavier", from_date: (Time.now + 4.month), to_date: (Time.now + 2.month), location_id: 2
Visit.create user_name: "Xavier", from_date: (Time.now + 1.month), to_date: (Time.now + 2.year), location_id: 1
Visit.create user_name: "JoseLuis", from_date: (Time.now + 1.year), to_date: (Time.now + 1.year + 1.week), location_id: 2