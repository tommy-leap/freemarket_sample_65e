# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lady = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")
baby = Category.create(name: "ベビー・キッズ")
interior = Category.create(name: "インテリア・住まい・小物")
book = Category.create(name: "本・音楽・ゲーム")
toy = Category.create(name: "おもちゃ・ホビー・グッズ")
beauty = Category.create(name: "コスメ・香水・美容")
homeelectronics = Category.create(name: "家電・スマホ・カメラ")
sports = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
car = Category.create(name: "自動車・オートバイ")
other = Category.create(name: "その他")

lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")
lady_skirt = lady.children.create(name: "スカート")
lady_dress = lady.children.create(name: "ワンピース")
lady_shoes = lady.children.create(name: "靴")
lady_pajamas = lady.children.create(name: "ルームウェア/パジャマ")
lady_legwear = lady.children.create(name: "レッグウェア")
lady_hat = lady.children.create(name: "帽子")
lady_bag = lady.children.create(name: "バッグ")
lady_accessory = lady.children.create(name: "アクセサリー")
lady_hairaccessory = lady.children.create(name: "ヘアアクセサリー")
lady_smallarticle = lady.children.create(name: "小物")
lady_watch = lady.children.create(name: "時計")

mens_tops = mens.children.create(name: "トップス")
mens_jacket = mens.children.create(name: "ジャケット/アウター")
mens_pants = mens.children.create(name: "パンツ")
mens_shoes = mens.children.create(name: "靴")
mens_bag = mens.children.create(name: "バッグ")
mens_suit = mens.children.create(name: "スーツ")
mens_hat = mens.children.create(name: "帽子")
mens_accessory = mens.children.create(name: "アクセサリー")
mens_smallarticle = mens.children.create(name: "小物")
mens_watch = mens.children.create(name: "時計")
mens_swimwear = mens.children.create(name: "水着")
mens_legwear = mens.children.create(name: "レッグウェア")
mens_underwear = mens.children.create(name: "アンダーウェア")
mens_other = mens.children.create(name: "その他")

baby_girl95 = baby.children.create(name: "ベビー服(女の子用)~95cm")

interior_kitchen = interior.children.create(name: "キッチン/食器")

book_books = book.children.create(name: "本")

toy_toys = toy.children.create(name: "おもちゃ")

beauty_make = beauty.children.create(name: "ベースメイク")

homeelectronics_mobile = homeelectronics.children.create(name: "スマートフォン/携帯電話")

sports_golf = sports.children.create(name: "ゴルフ")

handmade_accessories = handmade.children.create(name: "アクセサリー(女性用)")

ticket_music = ticket.children.create(name: "音楽")

car_cars = car.children.create(name: "自動車本体")

other_sale = other.children.create(name: "まとめ売り")

lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"},{name: "シャツ/ブラウス(半袖/袖なし)"},{name: "シャツ/ブラウス(七分/長袖)"},{name: "ポロシャツ"},{name: "キャミソール"},{name: "タンクトップ"},{name: "ホルターネック"},{name: "ニット/セーター"},{name: "チュニック"},{name: "カーディガン/ボレロ"},{name: "アンサンブル"},{name: "ベスト/ジレ"},{name: "パーカー"}])
lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"},{name: "レザージャケット"},{name: "ダウンジャケット"},{name: "ライダースジャケット"},{name: "ミリタリージャケット"},{name: "ダウンベスト"},{name: "ジャンパー/ブルゾン"},{name: "ポンチョ"},{name: "ロングコート"},{name: "トレンチコート"},{name: "ダッフルコート"},{name: "ピーコート"}])
lady_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ショートパンツ"}, {name: "カジュアルパンツ"},{name: "ハーフパンツ"},{name: "チノパン"},{name: "ワークパンツ/カーゴパンツ"},{name: "クロップドパンツ"},{name: "サロペット/オーバーオール"},{name: "オールインワン"},{name: "サルエルパンツ"},{name: "ガウチョパンツ"},{name: "その他"}])
lady_skirt.children.create([{name: "ミニスカート"}, {name: "ひざ丈スカート"}, {name: "ロングスカート"},{name: "キュロット"},{name: "その他"}])
lady_dress.children.create([{name: "ミニワンピース"}, {name: "ひざ丈ワンピース"}, {name: "ロングワンピース"},{name: "その他"}])
lady_shoes.children.create([{name: "ハイヒール/パンプス"}, {name: "ブーツ"}, {name: "サンダル"},{name: "スニーカー"},{name: "ミュール"},{name: "モカシン"},{name: "ローファー/革靴"},{name: "フラットシューズ/バレエシューズ"},{name: "長靴/レインシューズ"},{name: "その他"}])
lady_pajamas.children.create([{name: "パジャマ"}, {name: "ルームウェア"}])
lady_legwear.children.create([{name: "ソックス"}, {name: "スパッツ/レギンス"}, {name: "ストッキング/タイツ"},{name: "レッグウォーマー"},{name: "その他"}])
lady_hat.children.create([{name: "ニットキャップ/ビーニー"}, {name: "ハット"}, {name: "ハンチング/ベレー帽"},{name: "キャップ"},{name: "キャスケット"},{name: "麦わら帽子"},{name: "その他"}])
lady_bag.children.create([{name: "ハンドバッグ"}, {name: "トートバッグ"}, {name: "エコバッグ"},{name: "リュック/バックパック"},{name: "ボストンバッグ"},{name: "スポーツバッグ"},{name: "ショルダーバッグ"},{name: "クラッチバッグ"},{name: "ポーチ/バニティ"},{name: "ボディバッグ/ウェストバッグ"},{name: "マザーズバッグ"},{name: "メッセンジャーバッグ"},{name: "ビジネスバッグ"},{name: "旅行用バッグ/キャリーバッグ"}])
lady_accessory.children.create([{name: "ネックレス"}, {name: "ブレスレット"}, {name: "バングル/リストバンド"},{name: "リング"},{name: "ピアス(片耳用)"},{name: "ピアス(両耳用)"},{name: "イヤリング"},{name: "アンクレット"},{name: "ブローチ/コサージュ"},{name: "チャーム"},{name: "その他"}])
lady_hairaccessory.children.create([{name: "ヘアゴム/シュシュ"}, {name: "ヘアバンド/カチューシャ"}, {name: "ヘアピン"},{name: "その他"}])
lady_smallarticle.children.create([{name: "長財布"}, {name: "折り財布"}, {name: "コインケース/小銭入れ"},{name: "名刺入れ/定期入れ"},{name: "キーケース"},{name: "キーホルダー"},{name: "手袋/アームカバー"},{name: "ハンカチ"},{name: "ベルト"},{name: "マフラー/ショール"},{name: "ストール/スヌード"},{name: "バンダナ/スカーフ"},{name: "ネックウォーマー"},{name: "サスペンダー"}])
lady_watch.children.create([{name: "腕時計(アナログ)"}, {name: "腕時計(デジタル)"}, {name: "ラバーベルト"},{name: "レザーベルト"},{name: "金属ベルト"},{name: "その他"}])

mens_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"},{name: "シャツ"},{name: "ポロシャツ"},{name: "ポロシャツ"},{name: "タンクトップ"},{name: "ニット/セーター"},{name: "パーカー"},{name: "カーディガン"},{name: "スウェット"},{name: "ジャージ"},{name: "ベスト"},{name: "その他"}])
mens_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"},{name: "レザージャケット"},{name: "ダウンジャケット"},{name: "ライダースジャケット"},{name: "ミリタリージャケット"},{name: "ナイロンジャケット"},{name: "フライトジャケット"},{name: "ダッフルコート"},{name: "ピーコート"},{name: "ステンカラーコート"},{name: "トレンチコート"},{name: "モッズコート"}])
mens_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ワークパンツ/カーゴパンツ"}, {name: "スラックス"},{name: "チノパン"},{name: "ショートパンツ"},{name: "ペインターパンツ"},{name: "サルエルパンツ"},{name: "オーバーオール"},{name: "その他"}])
mens_shoes.children.create([{name: "スニーカー"}, {name: "サンダル"}, {name: "ブーツ"},{name: "モカシン"},{name: "ドレス/ビジネス"},{name: "長靴/レインシューズ"},{name: "デッキシューズ"},{name: "その他"}])
mens_bag.children.create([{name: "ショルダーバッグ"}, {name: "トートバッグ"}, {name: "ボストンバッグ"},{name: "リュック/バックパック"},{name: "ウェストポーチ"},{name: "ボディーバッグ"},{name: "ドラムバッグ"},{name: "ビジネスバッグ"},{name: "トラベルバッグ"},{name: "メッセンジャーバッグ"},{name: "エコバッグ"},{name: "その他"}])
mens_suit.children.create([{name: "スーツジャケット"}, {name: "スーツベスト"}, {name: "スラックス"},{name: "セットアップ"},{name: "その他"}])
mens_hat.children.create([{name: "キャップ"}, {name: "ハット"}, {name: "ニットキャップ/ビーニー"},{name: "ハンチング/ベレー帽"},{name: "キャスケット"},{name: "サンバイザー"},{name: "その他"}])
mens_accessory.children.create([{name: "ネックレス"}, {name: "ブレスレット"}, {name: "バングル/リストバンド"},{name: "リング"},{name: "ピアス(片耳用)"},{name: "ピアス(両耳用)"},{name: "アンクレット"},{name: "その他"}])
mens_smallarticle.children.create([{name: "長財布"}, {name: "折り財布"}, {name: "マネークリップ"},{name: "コインケース/小銭入れ"},{name: "名刺入れ/定期入れ"},{name: "キーケース"},{name: "キーホルダー"},{name: "ネクタイ"},{name: "手袋"},{name: "ハンカチ"},{name: "ベルト"},{name: "マフラー"},{name: "ストール"},{name: "バンダナ"}])
mens_watch.children.create([{name: "腕時計(アナログ)"}, {name: "腕時計(デジタル)"}, {name: "ラバーベルト"},{name: "レザーベルト"},{name: "金属ベルト"},{name: "その他"}])
mens_swimwear.children.create([{name: "一般水着"}, {name: "スポーツ用"}, {name: "アクセサリー"},{name: "その他"}])
mens_legwear.children.create([{name: "ソックス"}, {name: "レギンス/スパッツ"},{name: "レッグウォーマー"},{name: "その他"}])
mens_underwear.children.create([{name: "トランクス"}, {name: "ボクサーパンツ"}, {name: "その他"}])

baby_girl95.children.create([{name: "トップス"}])

interior_kitchen.children.create([{name: "食器"}])

book_books.children.create([{name: "文学/小説"}])

toy_toys.children.create([{name: "キャラクターグッズ"}])

beauty_make.children.create([{name: "ファンデーション"}])

homeelectronics_mobile.children.create([{name: "スマートフォン本体"}])

sports_golf.children.create([{name: "クラブ"}])

handmade_accessories.children.create([{name: "ピアス"}])

ticket_music.children.create([{name: "男性アイドル"}])

car_cars.children.create([{name: "国内自動車本体"}])


