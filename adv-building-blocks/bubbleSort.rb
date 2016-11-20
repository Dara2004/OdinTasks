#1
def bubble_sort(arr)
	length = arr.length - 1
	not_sorted = true

	while not_sorted == true 
		swapped = false

		length.times do |g|
		    if arr[g] > arr[g + 1]
		    	arr[g], arr[g + 1] = arr[g + 1], arr[g]
		    	swapped = true
		    end
		end
		
		not_sorted = false if swapped == false
	end
	return arr
end

p bubble_sort([4,3,78,2,0,2])

#2
def bubble_sort_by(arr)
	length = arr.length
	not_sorted = true

	while not_sorted == true 
		swapped = false
		(length - 1).times do |g|

			if yield(arr[g],arr[g+1]) > 0		        
		        arr[g], arr[g + 1] = arr[g + 1], arr[g]
		        swapped = true		        
		    end
		end
		
		not_sorted = false if swapped == false
	end
	return arr
end

p bubble_sort_by(["hi","hello","hey"]){ |left,right| left.length - right.length}

