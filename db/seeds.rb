# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# =>
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


District.create!(name:"北海道地方")
District.create!(name:"東北地方")
District.create!(name:"関東地方")
District.create!(name:"中部地方")
District.create!(name:"関西地方")
District.create!(name:"近畿地方")
District.create!(name:"中国地方")
District.create!(name:"四国地方")
District.create!(name:"九州・沖縄地方")

Race.create!(district_id:8,
             name:"石垣島トライアスロン",
             date:"2022-4-17",
             cost:28000,
             deadline:"2021-12-24",
             link:"https://ishigaki-triathlon.jp/",
             categorie:"スタンダード(swim:1.5㎞,bike:40㎞,run:10㎞）",
             venue:"沖縄県石垣市",
             introduction:"日本屈指の綺麗な海で、全力を尽くしましょう!!",
)

Admin.create!(
    email: 'admin@admin.com',
    password: '123456',
)

EndUser.create!(
    email: 'triathlon@.com',
    password: '123456',
    name:"トライアスロン　太郎"
)

