# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { name: '海釣り' },
  { name: '川釣り' },
  { name: 'エサ釣り' },
  { name: 'ルアー釣り' },
  { name: '豆知識' },
  { name: '危険生物' }
])

User.create!(
  email: 'AnglersNavi@mail.com',
  name: 'アングラーズナビ',
  introduction: 'アングラーズナビ公式アカウントです。',
  password: '123456'
)

User.create!(
  email: '123@mail.com',
  name: 'ユーザー1',
  introduction: '始めたばかりの初心者ですがよろしくお願いします。',
  password: '123456'
)

Admin.create!(
  email: 'admin@mail.com',
  name: 'admin',
  introduction: '管理者です',
  password: '123456'
)