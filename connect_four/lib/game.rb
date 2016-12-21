require_relative 'connect_four'


game = Connect_four.new
game.output_board


while game.win != true && game.tied? != true 
	num = gets.chomp
	game.add_piece(num)
	game.check_for_win
	game.output_board
end