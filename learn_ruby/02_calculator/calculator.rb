def add(num1,num2)
	result = num1 + num2
	return result
end

def subtract(num1,num2)
	result = num1 - num2
	return result
end

def sum(num1)
	result = num1.inject(0, :+)
	return result
end

def multiply(num1,num2)
	result = num1 * num2
	return result
	
end

def multiplyArray(num1)
	result = num1.inject(:*)
	return result
end

def power(num1,num2)
	result = num1 ** num2
	return result
end

def factorial(num1)
	if num1 <= 1
		return 1
	else
		return num1 * factorial(num1 - 1)
	end
end

