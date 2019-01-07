# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#   @todo = Todo.create!(title: Faker:: Lorem.word,
#                        created_by: Faker::Number.number(10))
#   10.times do
#     @todo.items.create!(name: Faker::StarWars.character, done: false)
#   end
# end

2.times do
  @user = User.create!(name: Faker::Name.name, email: Faker::Internet.free_email, password_digest: 'foobar')
end