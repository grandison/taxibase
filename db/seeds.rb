# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Level.destroy_all

levels = [
Level.create(number:0, name: "Администратор"),
Level.create(number:1, name: "Модератор"),
Level.create(number:2, name: "VIP"),
Level.create(number:3, name: "Пользователь"),
]

AdminUser.destroy_all

AdminUser.create(email: "test_admin@mail.ru", strict_password: "testtest", level_id: levels[0].id)
AdminUser.create(email: "test_moderator@mail.ru", strict_password: "testtest", level_id: levels[1].id)
AdminUser.create(email: "test_user_vip@mail.ru", strict_password: "testtest", level_id: levels[2].id)
AdminUser.create(email: "test_user_simple@mail.ru", strict_password: "testtest", level_id: levels[3].id)


