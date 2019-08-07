# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create(:genre_symbol => 'エンターテイメント')
Genre.create(:genre_symbol => 'ライフ')
Genre.create(:genre_symbol => 'サービス')
Genre.create(:genre_symbol => 'インターネット')
Genre.create(:genre_symbol => 'その他')