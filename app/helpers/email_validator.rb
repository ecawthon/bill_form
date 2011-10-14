class EmailValidator <ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		throw_error(record,attribute) unless value =~ /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}/
	end
	
	def throw_error(record, attribute)
		record.errors[attribute] << (options[:message] || "invalid email address")
	end
end
