def match(char)
	if $e[$i] == char
		$i += 1
	else
		return true
	end
	return false
end


def E()
	if match("keyword")
		EE()
	end
end


def EE()
	if match("operator")
		if match("addition")
		elsif match("subtraction")
		elsif match("multiplication")
		elsif match("division")
		else
			puts "error"
			exit
		end

	elsif match("semicolon")
		return
	else
		puts "error"
		exit
	end
end
