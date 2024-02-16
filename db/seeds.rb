# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# User.create!(
#   name: '此下明里',
#   email: 'minglicangzhi@gmail.com',
#   password: 'aki00aka',
#   password_confirmation: 'aki00aka',
#   role: 1
# )
Category.create!(
  name: '太陽堂について'
)
Category.create!(
  name: '煎じ薬作り'
)
Category.create!(
  name: '粉薬作り'
)
Category.create!(
  name: '錠剤・カプセル・丸剤'
)
Category.create!(
  name: '送り状作成'
)
Category.create!(
  name: '電話業務'
)
Category.create!(
  name: '梱包業務'
)
Category.create!(
  name: '来客のお客様ご案内'
)
Category.create!(
  name: 'メール業務'
)
Category.create!(
  name: 'LINE業務'
)
Category.create!(
  name: '電話業務'
)
Category.create!(
  name: 'その他業務'
)
Category.create!(
  name: '３階その他業務'
)
# 10.times do |index|
#   User.create!(
#       name: "ユーザー#{index}",
#       email: "test#{index}@test.com",
#       password: 'aaaaaaa',
#       password_confirmation: 'aaaaaaa',
#   )
# end
# 20.times do |index|
#   Manual.create!(
#       user: User.offset(rand(User.count)).first,
#       title: "タイトル#{index}",
#       category_id: Category.offset(rand(Category.count)).first,
#   )
# end