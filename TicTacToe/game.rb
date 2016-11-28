require_relative 'board'

game = TicTacToe.new


puts "Please follow the default layout\n
Press a number to play"
game.default_layout 
puts game.win?
puts game.tied?

while game.win? != false || game.tied? != false
	posit = gets.chomp
	game.add_position(posit.to_i)
	game.output_board
	puts " "
	puts game.win?
    puts game.tied?
end


