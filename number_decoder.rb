class NumberDecoder

	def initialize
		@number_mapping = {  
			2 => ['a', 'b', 'c'],
			3 => ['d', 'e', 'f'],
			4 => ['g', 'h', 'i'],
			5 => ['j', 'k', 'l'],
			6 => ['m', 'n', 'o'],
			7 => ['p', 'q', 'r', 's'],
			8 => ['t', 'u', 'v'],
			9 => ['w', 'x', 'y', 'z'] 
		}
	end

	def user_input
		puts "Enter a 10 phone number (numbers never contain a 0 or 1)"
		phone_number = gets.chomp
		if /\A[2-9]{10}\z/.match(phone_number)
			divide_the_number(phone_number)
		else
			puts "Please enter valid number"
		end
	end

	def divide_the_number(phone_number)
		@number_slice =  []	
		@number_slice << [phone_number[0,3], phone_number[3,phone_number.length]]
		@number_slice << [phone_number[0,5], phone_number[5,phone_number.length]]
		@number_slice << [phone_number[0,4], phone_number[4,phone_number.length]]
		@number_slice << [phone_number[0,6], phone_number[6,phone_number.length]]
		@number_slice << [phone_number[0,7], phone_number[7,phone_number.length]]
		@number_slice << [phone_number[0,10], nil]
	end

	def combinations_word(index_of_slice,index)
		digits = @number_slice[index_of_slice][index].split('')

		words = @number_mapping[digits[0].to_i].product(@number_mapping[digits[1].to_i]).map(&:join)

	  word_index = 2
		begin
			words = words.product(@number_mapping[digits[word_index].to_i]).map(&:join)
			word_index += 1	
		end while word_index < (digits.length)

		return words
	end

	def number_to_words
		(0).upto(5) do |index_of_slice|
			p combinations_word(index_of_slice,0)
			# combinations_word(index_of_slice,1)
		end
	end

end

number_decoder = NumberDecoder.new
number_decoder.user_input
number_decoder.number_to_words