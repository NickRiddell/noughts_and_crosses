require('pry-byebug')
require_relative('game')
#create game
game = Game.new()
#place piece
game.place_piece(0,0)
#display board
# puts game.show_board
#flip table
# game.flip_board
piece = :o
puts "checking if game is won #{ game.has_won?(piece) } expect to be false."
game.place_piece(1,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(0,2)
puts "checking if game is won #{ game.has_won?(piece) } expect to be true."

game.new_game
piece = :x
game.place_piece(0,0)
game.place_piece(0,1)
game.place_piece(1,0)
game.place_piece(0,2)
game.place_piece(2,0)
puts "checking if game is won vertical #{ game.has_won?(piece) } expect to be true."

game.new_game
piece = :o
game.place_piece(0,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(0,2)
game.place_piece(2,2)
puts "checking if game is won diagonal #{ game.has_won?(piece) } expect to be true."

game.new_game
piece = :x
game.place_piece(0,0)
game.place_piece(0,0)
game.place_piece(0,1)
game.place_piece(1,1)
game.place_piece(0,2)


binding.pry;''