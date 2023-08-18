# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
bun_bo = Restaurant.create!(name: 'Bun bo ba Roi', address: '123 Main Street')
oc_hut = Restaurant.create!(name: 'Oc hut Example', address: '456 Other Street')

bun_bo.dishes.create!(name: 'Tô bình dân', rating: 3)
bun_bo.dishes.create!(name: 'Tô đặc biệt', rating: 4)

oc_hut.dishes.create!(name: 'Ốc đá', rating: 5)
oc_hut.dishes.create!(name: 'Ốc thập cẩm xào dừa', rating: 3)