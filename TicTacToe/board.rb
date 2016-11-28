class TicTacToe
	def initialize
		@board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
		@letter = 'X'
		@cntr = 0
	end

	def add_position(position)
		if (1..9).include?(position) && @board[position-1] == " " && 
		@board[position-1] != "X" && @board[position-1] != "O"
		    @board[position-1] = @letter
		    @letter == 'X' ? @letter = 'O' : @letter = 'X'
		    @cntr = @cntr + 1
		end
	end

	def win?
		@winning_positions = [
		#Horizontal
		[0, 1, 2], [3, 4, 5], [6, 7, 8],
		#Vertical
		[0, 3, 6], [1, 4, 7],[2, 5, 8],
		#Diagonal
		[0, 4, 8], [2, 4, 6] 
	]
	@winning_positions.each do |num|
		first, second, third = num
		return true if @board[first] == 'X' && @board[second] == 'X' && @board[third] == 'X'
		return true if @board[first] == 'O' && @board[second] == 'O' && @board[third] == 'O'
	end
	return false
    end

    def output_board
    	puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    	puts "---+---+---"
    	puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    	puts "---+---+---"
    	puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def default_layout
    	@board = ['1','2','3','4','5','6','7','8','9']
    	output_board
    	@board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
    end

    def tied?
    	return true if @cntr == 9
    	return false
    end

end
