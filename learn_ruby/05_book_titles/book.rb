class Book
	attr_reader :title

	$illegalWords = ['The', 'A', 'An', 'And', 'The', 'In', 'Of']

	def title=(num1)
		 splittedNum1 = num1.split

		 for i in 0..splittedNum1.length - 1
		 	splittedNum1[i] = splittedNum1[i].capitalize

		 	if $illegalWords.include?(splittedNum1[i])
		 		splittedNum1[i] = splittedNum1[i].downcase
		 	end
		 end
		 splittedNum1[0] = splittedNum1[0].capitalize
		 @title = splittedNum1.join(' ')		 
	end
end
