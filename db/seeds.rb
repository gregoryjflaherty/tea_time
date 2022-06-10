# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Tea.destroy_all
Customer.destroy_all


5.times do |i|

    Customer.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.full_address,
      email: "user#{i + 1}@email.com",
      password: "password#{i + 1}",
    )

end

Tea.create!(title: "Green",description: Faker::GreekPhilosophers.quote,brew_time: Faker::Number.between(from: 1, to: 4),temperature: Faker::Number.between(from: 80, to: 85))
Tea.create!(title: "Black",description: Faker::GreekPhilosophers.quote,brew_time: Faker::Number.between(from: 1, to: 4),temperature: Faker::Number.between(from: 80, to: 85))
Tea.create!(title: "Chai",description: Faker::GreekPhilosophers.quote,brew_time: Faker::Number.between(from: 1, to: 4),temperature: Faker::Number.between(from: 80, to: 85))
Tea.create!(title: "Chamomile",description: Faker::GreekPhilosophers.quote,brew_time: Faker::Number.between(from: 1, to: 4),temperature: Faker::Number.between(from: 80, to: 85))
Tea.create!(title: "Herbal",description: Faker::GreekPhilosophers.quote,brew_time: Faker::Number.between(from: 1, to: 4),temperature: Faker::Number.between(from: 80, to: 85))
