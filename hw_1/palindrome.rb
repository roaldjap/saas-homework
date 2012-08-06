def palindrome? string
	reversed = string.downcase.gsub(/[\W\s]/, "").reverse
	orig = string.downcase.gsub(/[\W\s]/, "")
	if orig == reversed
		return true
	elsif orig != reversed
		return false
	else
		return true		
	end
	
end

def count_words string
	h = Hash.new(0)
	string.downcase.scan(/\w+/).map{|word| h[word] = string.downcase.scan(/\b#{word}\b/).size}
	return h
end




# palindrome?("A man, a plan, a canal -- Panama")
# palindrome?("Madam, I'm Adam!")
# palindrome?("Abracadabra")

# count_words("A man, a plan, a canal -- Panama")
# count_words("Madam, I'm Adam!")
# count_words("Abracadabra")
