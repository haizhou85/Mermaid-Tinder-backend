# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mermaids = [
  {
    name: 'Fish',
    age: 20,
    enjoys: "Collecting shells"
  },
  {
    name: 'Reef',
    age: 35,
    enjoys: "Long swims during sunset."
  }
]

mermaids.each do |attributes|
  Mermaid.create attributes
end
