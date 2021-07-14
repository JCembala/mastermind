require_relative 'mastermind'

# start game
board = Board.new
game = Game.new(board)
game.play