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
District.create!(name:"その他")

Race.create!(district_id:9,
             name:"石垣島トライアスロン",
             date:"2022-4-17",
             cost:28000,
             deadline:"2021-12-24",
             link:"https://ishigaki-triathlon.jp/",
             categorie:"スタンダード(swim:1.5㎞,bike:40㎞,run:10㎞）",
             venue:"沖縄県石垣市",
             introduction:"日本屈指の透明度を誇る海。レース後の観光も充実。
             羽田空港から石垣島までの直通便も出るのでアクセスも心配なしです。
             大会エントリーがすぐにいっぱいになることで有名な大会なのでエントリーはお早めに。",
)
Race.create!(district_id:4,
             name:"沼津千本浜トライアスロン",
             date:"2022-8-07",
             cost:"一般 18500",
             deadline:"2022-6-30",
             link:"https://www.triathlon-style.com/race/08/20220807_numazu_senbonhama/",
             categorie:"スプリント(swim:0.75㎞,bike:15㎞,run:6㎞）",
             venue:"静岡県沼津市",
             introduction:"都会からアクセス良し。距離も短めで初心者におすすめの大会です。
             最初の大会にいかがでしょうか。",
)

Race.create!(district_id:4,
             name:"佐渡国際トライアスロン",
             date:"2022-9-4",
             cost:"一般 40000",
             deadline:"2022-4-15",
             link:"https://www.triathlon-style.com/race/09/20220904_sadokokusai/",
             categorie:"ロング（swim:4.0km,bike:190km,run:42.2）",
             venue:"新潟県佐渡島",
             introduction:"30年以上続く老舗大会です。また、ロケーションとともに、「ボランティア」のサポートが熱い。
             早朝から遅くまで選手をいろいろなカタチで応援してくれます。距離が長いのでしっかりと準備をしてから望みたい大会です。",
)




Admin.create!(
    email: 'admin@admin.com',
    password: '123456',
)



EndUser.create!(
    email: 'triath@log.com',
    password: '123456',
    name: "トライアスロン太郎",
)

