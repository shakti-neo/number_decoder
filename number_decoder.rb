class NumberDecoder
	
	def user_input
		puts "Enter a 10 number (numbers never contain a 0 or 1)"
		number = gets.chomp
		if /\A[2-9]{10}\z/.match(number)
			puts number
		else
			puts "Please enter valid number"
		end
	end
end

number_decoder = NumberDecoder.new
number_decoder.user_input
