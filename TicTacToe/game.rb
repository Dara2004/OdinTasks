require_relative 'board'

game = TicTacToe.new


puts "Please follow the default layout\n
Press a number to play"
game.default_layout 

until game.win? || game.tied? 
	posit = gets.chomp
	game.add_position(posit.to_i)
	game.output_board
	puts " "

end

puts "A player has won the game" if game.win?
puts "It is a tie" if game.tied?