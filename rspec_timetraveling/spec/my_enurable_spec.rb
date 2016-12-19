require 'my_enurable_methods'

describe "Enumerable" do


    describe '#my_each' do
    	context "when called by non-enurables"	do
		    it "returns 'no method error'" do 
		    	expect{"Test".my_each.to raise_an_error(StandardError)}
		    end        
		    it "returns 'undefined local variable" do
		        expect{asd2rqf.my_each.to raise_an_error(StandardError)}
		    end
	    end

	    context "when given an array and a block " do
	    	it "should return array's element depending on index" do
	    		expect{|element| [2,4,6].my_each(&element)}.
	    		to yield_successive_args(2, 4, 6,)
	    	end
	    end

	end

	describe '#my_each_with_index'  do
		context "when called by non-enurables"	do
		    it "returns 'no method error'" do 
		    	expect{"Test".my_each.to raise_an_error(StandardError)}
		    end        
		    it "returns 'undefined local variable" do
		        expect{asd2rqf.my_each.to raise_an_error(StandardError)}
		    end
	    end
		context 'when given an array and an index' do
			it "should return the element and index" do
				expect { |element| [69,128,6969].my_each_with_index(&element) }.
				to yield_successive_args([69,0],[128,1],[6969,2])
			end
		end

	end


	describe '#my_select' do
		context "when called by non-enurables"	do
		    it "returns 'no method error'" do 
		    	expect{"Test".my_select.to raise_an_error(StandardError)}
		    end        
		    it "returns 'undefined local variable" do
		        expect{asd2rqf.my_select.to raise_an_error(StandardError)}
		    end
		end

		context 'when given a block' do 
		    it "should return the specified args" do
		        expect([2,3,6,8].my_select{|element| element % 3 == 0}).
		        to eql([3,6])
		    end		    
 	    end

	    context "when given an array with the specified block" do
	    	it "returns the element and the block in the same time" do
	    		expect {|element| [69,128,6969].my_select(&element) }.
	    			to yield_successive_args(69,128,6969)	    		
	    	end
	    end
	end



	describe '#my_all?' do
		context "when called by non-enurables"	do
		    it "returns 'no method error'" do 
		    	expect{"Test".my_all?.to raise_an_error(StandardError)}
		    end        
		    it "returns 'undefined local variable" do
		        expect{asd2rqf.my_all?.to raise_an_error(StandardError)}
		    end
		end
		context "when given a block" do
			it "should return true when the block calls for it" do
				expect([2,4,6].my_all? {|element| element % 2 == 0}).
				to eql(true)
			end
			it "should return false when the block calls for it" do
				expect([2,4,6].my_all? {|element| element % 2 == 1}).
				to eql(false)
			end
		end
	end


	describe '#my_any?' do
		context "when called by non-enurables"	do
		    it "returns 'no method error'" do 
		    	expect{"Test".my_any?.to raise_an_error(StandardError)}
		    end        
		    it "returns 'undefined local variable" do
		        expect{asd2rqf.my_any?.to raise_an_error(StandardError)}
		    end
		end

		context "when given a block" do
			it "should true when block calls for it" do
				expect([2,4,6].my_any? {|element| element == 6})
			end
			it "should return false when the block calls for it" do
				expect([2,4,6].my_any? {|element| element == 1}).
				to eql(false)
			end
			it "should also work with strings" do
				expect(['poop','gg','ez'].my_any? {|element| element == 'gg'} ).to eql(true)
				expect(['poop','gg','ez'].my_any? {|element| element == 'rape'} ).to eql(false)
			end

		end
	end


	describe '#my_none' do
		context "when called by non-enurables"	do
		    it "returns 'no method error'" do 
		    	expect{"Test".my_none?.to raise_an_error(StandardError)}
		    end        
		    it "returns 'undefined local variable" do
		        expect{asd2rqf.my_none?.to raise_an_error(StandardError)}
		    end
		end

		context "when given a block" do
			it "should true when block calls for it" do
				expect([2,4,6].my_any? {|element| element == 6})
			end
			it "should return false when the block calls for it" do
				expect([2,4,6].my_any? {|element| element == 1}).
				to eql(false)
			end
			it "should also work with strings" do
				expect(['poop','gg','ez'].my_any? {|element| element == 'gg'} ).to eql(true)
				expect(['poop','gg','ez'].my_any? {|element| element == 'rape'} ).to eql(false)
			end
		end
	end
end