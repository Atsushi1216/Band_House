# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User情報
User.create!(:email => "aaa@gmail.com",:name => "AHDGs",:profile_image => File.open('./app/assets/images/AHDGs.jpg'),:password => "000000")
User.create!(:email => "bbb@gmail.com",:name => "TenderTemper",:profile_image => File.open('./app/assets/images/tendertemper.jpg'),:password => "000000")
User.create!(:email => "ccc@gmail.com",:name => "Yudai.K",:profile_image => File.open('./app/assets/images/Yudai.png'),:password => "000000")
User.create!(:email => "ddd@gmail.com",:name => "匿さん",:profile_image => File.open('./app/assets/images/AHDGs3.jpg'),:password => "000000")