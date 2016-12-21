require 'connect_four'


describe 'Connect_four' do

    before(:each) do
    	@game = Connect_four.new
    end

    context 'during initialization' do
    	it "verifies global variables exist" do
    		expect(@game.board).to be_an_instance_of(Array)
    		expect(@game.player_letter).to be_an_instance_of(String)
    		expect(@game.player_turns).to be_an_instance_of(Fixnum)
    		expect(@game.win).to be_an_instance_of(FalseClass)
    	end
    end

    context 'when checking for ties' do
    	describe "@game.tied?" do
    		it "returns false when @player_turns is not 42" do
    			@game.player_turns = 31
    			expect(@game.tied?).to eql(false)    			    		
    			@game.player_turns = 52
    			expect(@game.tied?).to eql(false)    
    		end
    		it "returns true when @player_turns = 42" do
    			@game.player_turns = 42
    			expect(@game.tied?).to eql(true)
    		end
    	end
    end

    context 'when switching players' do
    	describe "@game.switch_players" do 
    		it "switches @player_letter to B when it is R" do
    			@game.player_letter = 'B'
    			@game.switch_players
    			expect(@game.player_letter).to eql('R')
    		end
    		it "switches @player_letter to R when it is B" do
    			@game.player_letter = 'R'
    			@game.switch_players
    			expect(@game.player_letter).to eql('B')
    		end
    	end
    end 

    context "when adding positions" do
    	describe "@game.add_piece" do
   	    	it "returns nil when tied" do
   	    		@game.player_turns = 42
   	    		expect(@game.add_piece(3)).to eql(nil)
   	    	end
   	        it "returns nil when above 7 and below 1" do
   	    	    expect(@game.add_piece(0)).to eql(nil)
   	            expect(@game.add_piece(8)).to eql(nil)
          	end
        	it "switches players properly" do
        		@game.add_piece(3)
        		expect(@game.player_letter).to eql('R')
        	end
        	it "returns nil when someone has won the game" do
        		@game.win = true
        		expect(@game.add_piece(2)).to eql(nil)
        	end
        	it "replaces the board element depending on num" do
        		@game.add_piece(1)
        		@game.add_piece(2)
        		@game.add_piece(3)
        		@game.add_piece(4)
        		@game.add_piece(5)
        		@game.add_piece(6)
        		@game.add_piece(7)

        		expect(@game.board[0][0] == ' ').to eql(false)
        		expect(@game.board[1][0] == ' ').to eql(false)
        		expect(@game.board[2][0] == ' ').to eql(false)
        		expect(@game.board[3][0] == ' ').to eql(false)
        		expect(@game.board[4][0] == ' ').to eql(false)
        		expect(@game.board[5][0] == ' ').to eql(false)
        		expect(@game.board[6][0] == ' ').to eql(false)
        	end        	
      	end      	
    end

    context "when checking for 4 same letters in a row " do    	
    	describe "@game.four_in_one_row?" do
    		it "changes @win to true if the elements of arr are 'B' " do
    			@game.four_in_one_row(['B','B','B','B'])
    			expect(@game.win).to eql(true)
    		end
    		it "changes @win to true if the elements of arr are 'R' " do
    			@game.four_in_one_row(['R','R','R','R'])
    			expect(@game.win).to eql(true)
    		end
    		it "returns nil for anything other than 'B' and 'R' " do
    			@game.four_in_one_row([' ',' ',' ',' '])
    			expect(@game.win).to eql(false)
    			@game.four_in_one_row(['B','R','B','R']) 
    			expect(@game.win).to eql(false)
    		end    		 
    	end

    	describe "@game.check_horizontal_line" do
    		it "should not do anything when not horizontal" do
    			@game.check_horizontal_line(0,0)
    			expect(@game.win).to eql(false)
    		end
    		it "should change @win to true when horizontal" do
    			@game.board[0][0] = 'B'
    			@game.board[1][0] = 'B'
    			@game.board[2][0] = 'B'
    			@game.board[3][0] = 'B'
    			@game.check_horizontal_line(0,0)
    			expect(@game.win).to eql(true)    			
    		end
    	end

    	describe "@game.check_vertical_line" do
    		it "should not do anything when not vertical" do    			
    			@game.board[0][0] = 'B'
    			@game.board[1][0] = 'B'
    			@game.board[2][0] = 'B'
    			@game.board[3][0] = 'B'
    			@game.check_vertical_line(0,0)
    			expect(@game.win).to eql(false) 
    		end
    		it "should change @win to true when vertical" do
    			@game.board[0][1] = 'R'
    			@game.board[0][2] = 'R'
    			@game.board[0][3] = 'R'
    			@game.board[0][4] = 'R'
    			@game.check_vertical_line(0,1)
    			expect(@game.win).to eql(true)
    		end
    	end

    	describe "@game.diagonal_line" do
    		it "should not do anything when not diagonal" do
    			@game.board[0][1] = 'R'
    			@game.board[0][2] = 'R'
    			@game.board[0][3] = 'R'
    			@game.board[0][4] = 'R'
    			@game.check_diagonal_line(0,1)
    			expect(@game.win).to eql(false)
    		end
    		it "should change @win to true when diagonal" do
    			@game.board[0][0] = 'R'
    			@game.board[1][1] = 'R'
    			@game.board[2][2] = 'R'
    			@game.board[3][3] = 'R'
    			@game.check_diagonal_line(0,0)
    			expect(@game.win).to eql(true)
    		end    		
    	end

    	describe "@game.check_opposite_of_diagonal_line" do
    	    it "should not do anything when not opposite of diagonal"  do
    	    	@game.board[0][0] = 'B'
    			@game.board[1][1] = 'B'
    			@game.board[2][2] = 'B'
    			@game.board[3][3] = 'B'
    			@game.check_opposite_of_diagonal_line(3,0)
    			expect(@game.win).to eql(false)
    		end 
    		it "should change @win to true when opposite of diagonal" do
    			@game.board[3][0] = 'B'
    			@game.board[2][1] = 'B'
    			@game.board[1][2] = 'B'
    			@game.board[0][3] = 'B'
    			@game.check_opposite_of_diagonal_line(3,0)
    			expect(@game.win).to eql(true)
    		end
    	end 
    end
end