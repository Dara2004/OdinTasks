def ftoc(ft)
	farenToCel(ft)
end

def ctof(cel)
	celToFaren(cel)
end

def farenToCel(num1)
	return (num1 - 32) * 5.0/9.0
end

def celToFaren(num1)
	return (num1 * 9/5) + 32
end