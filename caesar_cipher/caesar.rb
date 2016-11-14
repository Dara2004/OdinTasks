def caesar_cipher (string, number)
	string.scan (/./) do |i|
		if ("a".."z").include? (i.downcase) # Identify letters only. 
			number.times {i = i.next}
		end
		print i[-1] # Wrap from z to a. 
	end
end
 

caesar_cipher("What a string!", 5)