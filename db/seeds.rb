# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(
  name: '管理者',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 1
)
# 10.times do |index|
#   User.create!(
#       name: "ユーザー#{index}",
#       email: "test#{index}@test.com",
#       password: 'aaaaaaa',
#       password_confirmation: 'aaaaaaa',
#   )
# end
20.times do |index|
  Manual.create!(
      user: User.offset(rand(User.count)).first,
      title: "タイトル#{index}",
      category_id: Category.offset(rand(Category.count)).first,
  )
end