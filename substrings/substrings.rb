def substrings(str, arr)
	results = {}
    arr.each do |word|
      arr_of_counts = str.downcase.scan(word)
      count = arr_of_counts.count

      if count > 0
      	results[word] = count
      end

    end
    return results
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
