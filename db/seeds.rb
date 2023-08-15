# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Flat.create!(
    {
      name: "#{Faker::Adjective.positive.capitalize} & #{Faker::Adjective.positive.capitalize} #{Faker::Address.city_prefix} Flat London",
      address: ['31 West Street
        London
        SW54 3LM', '9446 George Street
        London
        SE58 7ZF', '9214 North Road
        London
        NW58 3VD', '89 Park Avenue
        London
        W98 6NV', '79 Park Lane
        London
        W73 2SK', '87 Main Road
        London
        SE13 5KV', '64 Park Road
        London
        SW75 4OK', '77 London Road
        London
        SW57 8UR'].sample,
      description: Faker::Quote.mitch_hedberg,
      price_per_night: rand(50..150),
      number_of_guests: rand(2..8),
      picture_url: 'https://loremflickr.com/960/720/apartment,building/all'
    }
  )
end
