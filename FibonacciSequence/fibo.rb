#1
def fibs(num)
	addition = 0
	num2 = 1
	cur = 0

	num.times do 
		addition = cur + num2
		cur = num2   #1
		num2 = addition
	end
	return addition
end

#2
def fibs_rec(num)
	return num if num == 0
	return num if num == 1
	return fibs_rec(num - 1) + fibs_rec(num - 2)
end

