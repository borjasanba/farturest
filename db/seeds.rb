# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! email: 'test@test.com', password: 'password', password_confirmation: 'password'
User.create! email: 'borjasanba@hotmail.com', password: 'password', password_confirmation: 'password'
Profile.create(name: 'Tester', user_id: 1, age: 32)
Profile.create(name: 'Borji', user_id: 2, age: 33)
Evaluation.create(rate: 5, comment: 'magnifico', source_profile_id: 1, target_profile_id: 2)
Evaluation.create(rate: 1, comment: 'menuda mierda', source_profile_id: 2, target_profile_id: 1)
Category.create(id: 1, name: 'Vegetariano')
Category.create(id: 2, name: 'Cocido tradicional')
Category.create(id: 3, name: 'Italiano')
Category.create(id: 4, name: 'Carnes y Pescados')
Category.create(id: 5, name: 'Arroces')
#Item.create(profile_id: 1, text_short: 'Testeando farturest casa', capacity: 4, date_finish: DateTime.parse("01/12/2015 13:00"), latitude: 40.4251188, longitude: -3.7033495000000585)
#Item.create(profile_id: 1, text_short: 'Testeando farturest curro', capacity: 2, date_finish: DateTime.parse("28/11/2015 13:00"), latitude: 40.4325693, longitude: -3.6310762000000523)
#Item.create(profile_id: 1, text_short: 'Testeando farturest casa antigua', capacity: 5, date_finish: DateTime.parse("15/11/2015 13:00"), latitude: 40.42458, longitude: -3.7094899999999598)
#Item.create(profile_id: 1, text_short: 'Testeando farturest casa pola', capacity: 9, date_finish: DateTime.parse("20/12/2015 13:00"), latitude: 43.15595, longitude: -5.82827999999995)
