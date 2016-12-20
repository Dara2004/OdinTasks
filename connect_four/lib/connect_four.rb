class Connect_four
	attr_accessor :board, :player_letter, :player_turns, :win
	
	def initialize
		@board = Array.new(7) {Array.new(6,' ')}
		@player_letter = 'B'
		@player_turns = 0
		@win = false
	end

	def output_board
		puts "\n       PLAYER TURN: #{@player_letter}\n "
		puts "  1   2   3   4   5   6   7  "
		
		puts "| #{@board[0][5]} | #{@board[1][5]} | #{@board[2][5]} | #{@board[3][5]} | #{@board[4][5]} | #{@board[5][5]} | #{@board[6][5]} |"
		puts "-----------------------------"
		puts "| #{@board[0][4]} | #{@board[1][4]} | #{@board[2][4]} | #{@board[3][4]} | #{@board[4][4]} | #{@board[5][4]} | #{@board[6][4]} |"		
		puts "-----------------------------"
		puts "| #{@board[0][3]} | #{@board[1][3]} | #{@board[2][3]} | #{@board[3][3]} | #{@board[4][3]} | #{@board[5][3]} | #{@board[6][3]} |"
		puts "-----------------------------"
		puts "| #{@board[0][2]} | #{@board[1][2]} | #{@board[2][2]} | #{@board[3][2]} | #{@board[4][2]} | #{@board[5][2]} | #{@board[6][2]} |"	
		puts "-----------------------------"
		puts "| #{@board[0][1]} | #{@board[1][1]} | #{@board[2][1]} | #{@board[3][1]} | #{@board[4][1]} | #{@board[5][1]} | #{@board[6][1]} |"		
		puts "-----------------------------"
		puts "| #{@board[0][0]} | #{@board[1][0]} | #{@board[2][0]} | #{@board[3][0]} | #{@board[4][0]} | #{@board[5][0]} | #{@board[6][0]} |"		
		puts "-----------------------------"
	end

	def switch_players
		@player_letter == 'B' ? @player_letter = 'R' : @player_letter = 'B'
	end

	def add_piece(num)
		num = num.to_i
		num -= 1
		if (0..6).include?(num)	&& @board[num][-1] == ' ' && tied? == false
			@player_turns += 1
			cntr = 0
			while @board[num][cntr] != ' '
				cntr += 1
			end
			@board[num][cntr] = @player_letter
			switch_players			
		end
		return nil				
	end

	def tied?
		return true if @player_turns == 42
		return false
	end

	def four_in_one_row(arr)		
		@win = true if arr.all? {|letter| letter == 'B'} || arr.all? {|letter| letter == 'R'}
		return nil
	end


	def check_for_win
		collumn = 0
		row = 0

		while collumn != @board.size		
			if collumn < 3 #checks for horizontal line ---
				horizontal = [@board[collumn][row],@board[collumn + 1][row],@board[collumn + 2][row],@board[collumn + 3][row]]
				four_in_one_row(horizontal)
			end
 
            row = 0
			while row != @board[0].size
				if row < 3   #checks for vertical line |
				    vertical = [@board[collumn][row],@board[collumn][row + 1],@board[collumn][row + 2],@board[collumn][row + 3]]
				    four_in_one_row(vertical)
				end
				row += 1				
			end
			collumn += 1
		end

	end









end








game = Connect_four.new

game.output_board
loop do 
	num = gets.chomp
	game.add_piece(num)
	game.check_vertical_for_win
	game.output_board
	puts "WIN #{game.win}"
end
