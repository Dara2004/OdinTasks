require 'tic_tac_toe'

 
describe 'TicTacToe' do

	before(:each) do
       @game = TicTacToe.new
    end

    it "verifies global variables exist" do
        expect(@game.board).to be_an_instance_of(Array)
        expect(@game.letter).to be_an_instance_of(String)
        expect(@game.cntr).to be_an_instance_of(Fixnum)
    end

    context "when adding a position" do
    	it "should return nil with strings " do    		
    		expect(@game.add_position("ggez")).to eql(nil)
    	end
    	it "should return nil with numbers over 9 and below 1 " do    		
    		expect(@game.add_position(0)).to eql(nil)
    		expect(@game.add_position(10)).to eql(nil)
    	end
    	it "should work properly with numbers 1 to 9" do
    	    @game.add_position(2)
    	    expect(@game.board).
    	    to eql([' ','X',' ',' ',' ',' ',' ',' ',' '])
    	end
    end

    context "when checking for a win" do
    	it "returns true when diagonal" do
    		@game.board = ['X',' ',' ',' ','X',' ',' ',' ','X']
    		expect(@game.win?).to eql(true)
    	end
    	it "returns true when vertical" do 
    		@game.board = ['O',' ',' ','O',' ',' ','O',' ',' ']
    		expect(@game.win?).to eql(true)
    	end
    	it "returns true when horizontal" do
    	    @game.board = ['X','X','X',' ',' ',' ',' ',' ',' ']
    	    expect(@game.win?).to eql(true)
    	end
    	it "returns false when its not horizontal/vertical/diagonal" do
    	    @game.board = ['X',' ','O','O',' ','X',' ',' ',' ']
    	    expect(@game.win?).to eql(false)
    	end
    end

    context "when activating default_layout" do
    	it "resets board to default spaces" do
    		@game.default_layout
    		expect(@game.board).
    		to eql([' ',' ',' ',' ',' ',' ',' ',' ',' '])
    	end
    end

    context "when checking if the game is tied" do
    	it "returns trie if cntr is equal to 9" do
    		@game.cntr = 9
    		expect(@game.tied?).to eql(true)
    	end
    	it "returns false if cntr is not 9" do
    		@game.cntr = 6
    		expect(@game.tied?).to eql(false)
    	end
    end
    
end