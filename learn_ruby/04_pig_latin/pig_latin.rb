$vowels = ['a','e','i','o','u']

$consonants = ['b','c','d','f','g',
	'h','j','k','l','m','n','p','q','r','s',
	't','v','w','x','y','z',]


def translate(num1)
	checker(num1)
end



def consonantConvert(num1)
	cntr = 0

	while $consonants.include?(num1[cntr]) 
		if num1[cntr] == 'q' && num1[cntr + 1] == 'u'
			cntr += 1
		end
		cntr += 1
	end

	for i in 0...cntr
		num1 = num1 + num1[i]
	end

	for i in 0...cntr
		num1[0] = ''
	end

	num1 = num1 + 'ay'
	return num1

end


def checker(num1)
	arrNum = num1.split

	i = 0

	for i in 0..arrNum.length - 1
		currentWord = arrNum[i]

		if $consonants.include?(currentWord[0])
			newCurrent = consonantConvert(currentWord)
		end

		if $vowels.include?(currentWord[0])
			newCurrent = currentWord + 'ay'
		end

		arrNum[i] = newCurrent
	end

	num1 = arrNum.join(' ')
    return num1

end 
