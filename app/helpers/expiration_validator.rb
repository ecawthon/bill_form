#From https://gist.github.com/1182499

class ExpirationValidator <ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		throw_error(record,attribute) unless value =~ /^((1[0-2])|(0{0,1}[1-9]{1}))(\/(((0{0,1}[1-9])|([12][1-9]))|(3[01])){0,1}){0,1}?\/20[0-9]{2}$/
	end
	
	def throw_error(record, attribute)
		record.errors[attribute] << (options[:message] || "date is invalid")
	end
end
