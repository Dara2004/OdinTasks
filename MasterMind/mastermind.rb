class Mastermind
	def initialize
		@arr = Array.new(10) {Array.new(4,'  ')}
		@corr = Array.new(10) { Array.new(2,0)  }
		@colors = ['re','gr','pu','ye','br','or','bl','wh']
		@secret_code = nil
		@reveal = false
		@win = false
	end

	def output_board
		puts "_____________________"
        puts "|_#{@reveal ? @secret_code[0] : '??'}_|_#{@reveal ? @secret_code[1] : '??'}_|_#{@reveal ? @secret_code[2] : '??'}_|_#{@reveal ? @secret_code[3] : '??'}_|"
        puts "|_#{@arr[9][0]}_|_#{@arr[9][1]}_|_#{@arr[9][2]}_|_#{@arr[9][3]}_|--> #{@corr[9][0] == 0 ? ' ' : 'White: '}#{@corr[9][0] == 0 ? ' ' : @corr[9][0]} #{@corr[9][1] == 0 ? ' ' : 'Red:'} #{@corr[9][1] == 0 ? ' ' : @corr[9][1]}"
        puts "|_#{@arr[8][0]}_|_#{@arr[8][1]}_|_#{@arr[8][2]}_|_#{@arr[8][3]}_|--> #{@corr[8][0] == 0 ? ' ' : 'White: '}#{@corr[8][0] == 0 ? ' ' : @corr[8][0]} #{@corr[8][1] == 0 ? ' ' : 'Red:'} #{@corr[8][1] == 0 ? ' ' : @corr[8][1]}"
        puts "|_#{@arr[7][0]}_|_#{@arr[7][1]}_|_#{@arr[7][2]}_|_#{@arr[7][3]}_|--> #{@corr[7][0] == 0 ? ' ' : 'White: '}#{@corr[7][0] == 0 ? ' ' : @corr[7][0]} #{@corr[7][1] == 0 ? ' ' : 'Red:'} #{@corr[7][1] == 0 ? ' ' : @corr[7][1]}"
        puts "|_#{@arr[6][0]}_|_#{@arr[6][1]}_|_#{@arr[6][2]}_|_#{@arr[6][3]}_|--> #{@corr[6][0] == 0 ? ' ' : 'White: '}#{@corr[6][0] == 0 ? ' ' : @corr[6][0]} #{@corr[6][1] == 0 ? ' ' : 'Red:'} #{@corr[6][1] == 0 ? ' ' : @corr[6][1]}"
        puts "|_#{@arr[5][0]}_|_#{@arr[5][1]}_|_#{@arr[5][2]}_|_#{@arr[5][3]}_|--> #{@corr[5][0] == 0 ? ' ' : 'White: '}#{@corr[5][0] == 0 ? ' ' : @corr[5][0]} #{@corr[5][1] == 0 ? ' ' : 'Red:'} #{@corr[5][1] == 0 ? ' ' : @corr[5][1]}"
        puts "|_#{@arr[4][0]}_|_#{@arr[4][1]}_|_#{@arr[4][2]}_|_#{@arr[4][3]}_|--> #{@corr[4][0] == 0 ? ' ' : 'White: '}#{@corr[4][0] == 0 ? ' ' : @corr[4][0]} #{@corr[4][1] == 0 ? ' ' : 'Red:'} #{@corr[4][1] == 0 ? ' ' : @corr[4][1]}"
        puts "|_#{@arr[3][0]}_|_#{@arr[3][1]}_|_#{@arr[3][2]}_|_#{@arr[3][3]}_|--> #{@corr[3][0] == 0 ? ' ' : 'White: '}#{@corr[3][0] == 0 ? ' ' : @corr[3][0]} #{@corr[3][1] == 0 ? ' ' : 'Red:'} #{@corr[3][1] == 0 ? ' ' : @corr[3][1]}"
        puts "|_#{@arr[2][0]}_|_#{@arr[2][1]}_|_#{@arr[2][2]}_|_#{@arr[2][3]}_|--> #{@corr[2][0] == 0 ? ' ' : 'White: '}#{@corr[2][0] == 0 ? ' ' : @corr[2][0]} #{@corr[2][1] == 0 ? ' ' : 'Red:'} #{@corr[2][1] == 0 ? ' ' : @corr[2][1]}"
        puts "|_#{@arr[1][0]}_|_#{@arr[1][1]}_|_#{@arr[1][2]}_|_#{@arr[1][3]}_|--> #{@corr[1][0] == 0 ? ' ' : 'White: '}#{@corr[1][0] == 0 ? ' ' : @corr[1][0]} #{@corr[1][1] == 0 ? ' ' : 'Red:'} #{@corr[1][1] == 0 ? ' ' : @corr[1][1]}"
        puts "|_#{@arr[0][0]}_|_#{@arr[0][1]}_|_#{@arr[0][2]}_|_#{@arr[0][3]}_|--> #{@corr[0][0] == 0 ? ' ' : 'White: '}#{@corr[0][0] == 0 ? ' ' : @corr[0][0]} #{@corr[0][1] == 0 ? ' ' : 'Red:'} #{@corr[0][1] == 0 ? ' ' : @corr[0][1]}"
	end

	def generate_secret_code
		@secret_code = Array.new(4) { |gg| gg = @colors[rand(7)]}		
	end

	def is_color?(arr)
		arr.each do |arr|
			return false if !@colors.include?(arr)
		end
		return true
	end

	def ask_for_input
		temp_arr = Array.new
        while temp_arr.size < 4 
		    temp_arr = gets.chomp
	        temp_arr = temp_arr.split(' ')
	        p @secret_code

	        if temp_arr.size < 4 
	            puts "please enter 4 colors with spaces in between "
            end

            if !is_color?(temp_arr)
            	puts "please choose valid colors 're','gr','pu','ye','br','or','bl','wh' "
            	temp_arr = ['','']
            end
        end
        return temp_arr
	end

	def check_if_same(inp_arr,cntr)
		red = 0
		white = 0
		
		4.times do |g|
			red += 1 if inp_arr[g] == @secret_code[g]
			white += 1 if inp_arr.include?(@secret_code[g])
		end

		if red == 4
			@win = true
		end
		@corr[cntr][0] = white - red
		@corr[cntr][1] = red
		
	end


	def engine_activate
		temp_arr = Array.new
		i = 0

		until @win == true || i == 10
			user_input = ask_for_input
			@arr[i] = user_input
			check_if_same(user_input,i)
			output_board
			i += 1
		end
		
		@reveal = true
		output_board


		puts "Solver wins the game" if @win == true
		puts "Solver Loses" if @win == false && i == 10	
	end




	


end

game = Mastermind.new
game.generate_secret_code
game.output_board
game.engine_activate