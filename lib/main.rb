require_relative 'game'

# start game
board = Board.new
game = Game.new(board)
game.play