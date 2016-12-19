require "caesar"

describe "caesar_cipher" do 
	
	context "given an ordinary string " do
		it "('What a string!', 5)" do
			expect(caesar_cipher('What a string!', 5)).to eql("Bmfy f xywnsl!")
		end
	end

	context "given string numbers" do 
		it ("should not change output") do
			expect(caesar_cipher('12345',3)).to eql("12345")
		end
	end
end
