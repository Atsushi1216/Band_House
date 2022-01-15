# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User初期設定
User.create!(:email => "aaa@gmail.com",:name => "AHDGs",:profile_image => File.open('./app/assets/images/AHDGs.jpg'),:password => "000000")
User.create!(:email => "bbb@gmail.com",:name => "TenderTemper",:profile_image => File.open('./app/assets/images/tendertemper.jpg'),:password => "000000")
User.create!(:email => "ccc@gmail.com",:name => "Yudai.K",:profile_image => File.open('./app/assets/images/Yudai.png'),:password => "000000")
User.create!(:email => "ddd@gmail.com",:name => "匿さん",:profile_image => File.open('./app/assets/images/AHDGs3.jpg'),:password => "000000")

#Music初期設定
Music.create!(:title => "99%HELL",:caption => "2020年に再結成を目論んだ際に作ったdemo曲です。",:song_image => File.open('./app/assets/images/99%HELL.jpg'),:song => File.open('./app/assets/musics/99%HELL.mp3'),:user_id => "1",:evaluation => "5")
Music.create!(:title => "Candy(The Wub Machine Remix)",:caption => "2013年に作った珠玉の名曲とも言われたcandyをremixしました。",:song_image => File.open('./app/assets/images/Candy.png'),:song => File.open('./app/assets/musics/Candy(The Wub Machine Remix).mp3'),:user_id => "2",:evaluation => "4")
Music.create!(:title => "kienzan",:caption => "インストルメンタルの曲を作ってみました。聞いてみてください。",:song_image => File.open('./app/assets/images/kienzan.jpg'),:song => File.open('./app/assets/musics/kienzan.mp3'),:user_id => "4",:evaluation => "5")
Music.create!(:title => "Nirvana(du0 edit)",:caption => "マイナーコード進行の曲です。",:song_image => File.open('./app/assets/images/是々.png'),:song => File.open('./app/assets/musics/Nirvana(du0 edit).mp3'),:user_id => "1",:evaluation => "4")
Music.create!(:title => "vritra",:caption => "エンディングっぽい曲にしました。",:song_image => File.open('./app/assets/images/是々.png'),:song => File.open('./app/assets/musics/vritra.mp3'),:user_id => "1",:evaluation => "5")