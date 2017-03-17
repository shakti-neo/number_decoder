require 'set'

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

		@result = []

		@file_read = Set.new(File.read("dictionary.txt").downcase.split("\n"))
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

	def operation_second_slice(index_of_slice,first_word)
		unless @number_slice[index_of_slice][1].nil?
			words = combinations_word(index_of_slice,1)

			words.each do |word|
				@result << [first_word, word] if @file_read.include?(word)
			end
		else
			@result << first_word
		end	
	end

	def number_to_words
		6.times do |index_of_slice|
			words = combinations_word(index_of_slice,0)

			words.each do |word|
				operation_second_slice(index_of_slice, word) if @file_read.include?(word)
			end
		end
		p @result
	end
end

number_decoder = NumberDecoder.new
number_decoder.user_input
number_decoder.number_to_words
	
