# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    @gym_1 = ClimbingGym.create!(name: "Movement", city: "Golden", number_of_routes: 500, classes_offered: true)
    @gym_2 = ClimbingGym.create!(name: "Vertical Ventures", city: "Denver", number_of_routes: 300, classes_offered: false)
    @gym_3 = ClimbingGym.create!(name: "Movement", city: "Englewood", number_of_routes: 1000, classes_offered: true)
    @patron_1 = @gym_1.patrons.create!(name: 'Jade Stewart', years_member: 6, belay_certified: true)
    @patron_2 = @gym_1.patrons.create!(name: 'Philip DeFraties', years_member: 6, belay_certified: true)
    @patron_3 = @gym_2.patrons.create!(name: 'Sean Morris', years_member: 7, belay_certified: true)
    @patron_4 = @gym_2.patrons.create!(name: 'Denise Corona', years_member: 2, belay_certified: true)