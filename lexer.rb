def createTokens(path)
	file = File.open(path)
	input = file.read
	file.close
	#input = input.gsub(/(){}[]+-;/, ' \0')
	contents = input.split(" ")
	tokens = []

	for i in 0...contents.length
		t = contents[i]

		if t == "int"
			tokens.append("keyword")
			tokens.append("int")
		elsif t == "+"
			tokens.append("opperator")
			tokens.append("addition")
		elsif t == "="
			tokens.append("operator")
			tokens.append("equals")
		elsif t == "("
			tokens.append("open-paren")
		elsif t == ")"
			tokens.append("closed-paren") 
		elsif "1234567890".include?(t)
			tokens.append("int-literal")
			tokens.append(t)
		elsif t == ";"
			tokens.append("semi-colon")
		else
			tokens.append("var")
			tokens.append(t)
		end
	end
	return tokens
end
