def translate (word_string)
	vowels = ["a","e","i","o","u","y","A","E","I","O","U","Y"]
	words_arr = word_string.split(" ")
	latin_arr = []

	words_arr.each do |word|
		
		nd_vowel = false
		vowels.each do |vowel|
			if word[1] == vowel
				nd_vowel = true
			end
		end
		cont_vowel = false
		vowels.each do |vowel|
			if word[0] == vowel
				cont_vowel = true
			end
		end

		rd_vowel = false
		vowels.each do |vowel|
			if word[2] == vowel
				rd_vowel = true
			end
		end


		if word[0..1] == "qu"
			latin_arr << word[2..word.length-1] + "quay"
		elsif word [1..2] == "qu"
			latin_arr << word[3..word.length-1] + word[0..2] + "ay"
		elsif cont_vowel
			latin_arr << word+"ay"
		elsif !nd_vowel && !cont_vowel && !rd_vowel
			latin_arr << word[3..word.length-1]+word[0..2]+"ay"
		elsif !nd_vowel && !cont_vowel
			latin_arr << word[2..word.length-1]+word[0..1]+"ay"
		else
			latin_arr << word[1..word.length-1]+word[0]+"ay"
		end
	end

	return latin_arr.join(" ")
end


puts translate("Charlie Xavier Anas ZXC OIS")



