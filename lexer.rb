def readfile(path)
	file = File.open(path)
	input = file.read
	file.close
	#input = input.gsub(/(){}[]+-;/, ' \0')
	contents = input.split(" ")
	return contents
end

def createTokens(path)
	contents = readfile(path)
	tokens = []

	for i in 0...contents.length
		t = contents[i]

		if t == "int"
			tokens.append("keyword")

		elsif t == "+"
			tokens.append("opperator")

		elsif t == "="
			tokens.append("operator")

		elsif t == "("
			tokens.append("open-paren")

		elsif t == ")"
			tokens.append("closed-paren") 

		elsif t == "{"
			tokens.append("open-bracket")

		elsif t == "}"
			tokens.append("closed-bracket")

		elsif t == "["	
			tokens.append("open-brace")

		elsif t == "]"
			tokens.append("closed-brace")

		elsif "1234567890".include?(t)
			tokens.append("int-literal")

		elsif t == ";"
			tokens.append("semicolon")

		else
			tokens.append("var")
		end
	end
	return tokens
end
