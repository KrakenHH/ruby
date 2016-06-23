def caeser_cipher(str, num)
	chars = str.split('')

	cipheredMessage = []

	chars.each do |letter|

		if letter != " " && letter != "!"
			ordinance = letter.sum
			ordinance += num


			if letter == letter.downcase				
			  if ordinance > 122
			  	ordinance = 96 + (ordinance-122)
			  end
			end

			if letter == letter.upcase
				if ordinance > 90
					ordinance = 64 + (ordinance-90)
				end
			end

			newLetter = ordinance.chr
			cipheredMessage << newLetter
		else
			cipheredMessage << letter
		end

	end

	return cipheredMessage.join
end

puts "enter a message to the great caeser_cipher"
message = gets.chomp

puts "enther the ammount of digits you would like to shift"
shift_num = gets.chomp.to_i

puts caeser_cipher(message,shift_num)



