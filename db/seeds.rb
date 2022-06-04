# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
Image.delete_all
Image.reset_pk_sequence
Image.create([
               {name: 'DokeV', file: 'dokev.672x1080.2021-08-26.7.jpg', theme_id: 2},
               {name: 'Fifa-22', file: 'fifa-22.720x1080.2021-07-12.7.jpg', theme_id: 2},
               {name: 'EldenRing', file: 'elden-ring.720x1080.2022-01-30.40.jpg', theme_id: 2},
               {name: 'ForzaHorizon5', file: 'forza-horizon-5.1080x1080.2021-08-24.28.jpg', theme_id: 3},
               {name: 'Kirby-and-the-Forgotten-Land', file: 'kirby-and-the-forgotten-land.1080x1080.2021-09-24.6.jpg', theme_id: 4},
             ])

Theme.delete_all
Theme.reset_pk_sequence
Theme.create([

               {name: "-----"},      # 1 Нет темы
               {name: "Лучшая игра 2022?"},      # 2
               {name: "Лучший гоночный симулятор?"},      # 3
               {name: "Выбор игроков Nintendo Switch?"},      # 4
             ])

User.delete_all
User.reset_pk_sequence
User.create([
              {name: "Example User", email: "example@railstutorial.org"},
            ])

Value.delete_all
Value.reset_pk_sequence
Value.create( [
                {user_id: 1, image_id: 4, value: 9},
                {user_id: 1, image_id: 2, value: 3},
                {user_id: 1, image_id: 3, value: 6},
              ])