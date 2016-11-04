def echo(num1)
	return num1
end

def shout(num1)
	return num1.upcase
end

def repeat(num1,num2 = 2)
	joined = (num1 + ' ') * num2
	joined[joined.length - 1] = ''
	return joined
end

def start_of_word(num1,num2)
	last = num2 - 1
	return num1[0..last]
end

def first_word(num1)
	return num1.split.first
end

def titleize(num2)
	num2 = num2.split.map(&:capitalize)
	
	for i in 0..num2.length - 1
		if (num2[i] == 'And') || (num2[i] == 'Over') || (num2[i] == 'The')
			num2[i] = num2[i].downcase
		end
	end

	num2[0] = num2[0].capitalize

	return num2.join(' ')
end