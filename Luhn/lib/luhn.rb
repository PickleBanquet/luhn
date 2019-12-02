module Luhn
	def self.is_valid?(number)
		digits = number.to_s.reverse.chars.map(&:to_i)
		check_sum = 0

		digits.each_slice(2) do |odd, even|
			check_sum += odd
			next unless even
			even *= 2
			even = even.divmod(10).inject(:+) if even > 9
			check_sum += even
		end

		return check_sum.modulo(10) == 0
	end
end

puts "#{Luhn.is_valid?(4194560385008504)}"
puts "#{Luhn.is_valid?(4194560385008505)}"