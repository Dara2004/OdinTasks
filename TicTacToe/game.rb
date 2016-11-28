require_relative 'board'

game = TicTacToe.new


puts "Please follow the default layout\n
Press a number to play"
game.default_layout 
puts game.win?
puts game.tied?

while game.win? != true || game.tied? != true
	posit = gets.chomp
	game.add_position(posit.to_i)
	game.output_board
	puts " "
end


