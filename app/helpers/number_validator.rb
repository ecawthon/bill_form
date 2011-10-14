#From https://gist.github.com/1182499

class NumberValidator <ActiveModel::EachValidator
	def validate_each(record, attribute, number)
	  number = number.to_s.gsub(/\D/, "")
	  
	  throw_error(record,attribute) unless valid_association?(number)
	  number.reverse!

	  relative_number = {'0' => 0, '1' => 2, '2' => 4, '3' => 6, '4' => 8, '5' => 1, '6' => 3, '7' => 5, '8' => 7, '9' => 9}

	  sum = 0

	  number.split("").each_with_index do |n, i|
	    sum += (i.even?) ? n.to_i : relative_number[n]
	  end

	  throw_error(record,attribute) unless sum % 10 == 0
	end

	def valid_association?(number)
	  number = number.to_s.gsub(/\D/, "")

	  return :dinners if number.length == 14 && number =~ /^3(0[0-5]|[68])/ # 300xxx-305xxx, 36xxxx, 38xxxx
	  return :amex if number.length == 15 && number =~ /^3[47]/ # 34xxxx, 37xxxx
	  return :visa if [13,16].include?(number.length) && number =~ /^4/ # 4xxxxx
	  return :master if number.length == 16 && number =~ /^5[1-5]/ # 51xxxx-55xxxx
	  return :discover if number.length == 16 && number =~ /^6011/ # 6011xx
	  return nil
	end
	
	def throw_error(record, attribute)
		record.errors[attribute] << (options[:message] || "invalid credit card number")
	end
end
