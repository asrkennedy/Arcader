# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Match.destroy_all
User.destroy_all
Game.destroy_all
Move.destroy_all

Match.create! game_id: 1, player1_id: 3, player2_id: 4, winner: 3, loser: 4

User.create! name:'Stu', gender: 'male', user_image: '#', username: "sknight126", password: "stu", bio: "Stu Knight is awesome"

User.create! name:'Andrea', gender: 'female', user_image: '#', username: "andreayea", password: "password", bio: "Andrea is the coolest"

Game.create! name: 'Tic Tac Toe', description: 'The classic strategy game of noughts and crosses!', instructions: "Get 3 in a row before your opponent does!", game_image: "TicTacToe.jpeg"
