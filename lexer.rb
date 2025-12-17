Token = Struct.new(:type, :value)

def readfile(path)
	file = File.open(path)
	input = file.read
	file.close
	input = input.gsub(/([{()};])/, ' \0').strip
	contents = input.split(" ")
	return contents
end

def createTokens(path)
	contents = readfile(path)
	tokens = []

	for i in 0...contents.length
		t = contents[i]

		if t == "int"
			tokens.append(Token.new(:keyword, "int"))

		elsif t == "+"
			tokens.append(Token.new(:operator, "+"))

		elsif t == "="
			tokens.append(Token.new(:operator, "="))

		elsif t == "("
			tokens.append(Token.new(:paren, "("))

		elsif t == ")"
			tokens.append(Token.new(:paren, ")"))

		elsif t == "{"
			tokens.append(Token.new(:bracket, "{"))

		elsif t == "}"
			tokens.append(Token.new(:bracket, "}"))

		elsif t == "["	
			tokens.append(Token.new(:brace, "["))

		elsif t == "]"
			tokens.append(Token.new(:brace, "]"))

		elsif "1234567890".include?(t)
			tokens.append(Token.new(:int, t))

		elsif t == ";"
			tokens.append(Token.new(:eol, "semicolon"))

		elsif t == "return"
			tokens.append(Token.new(:ret, "return"))

		else
			tokens.append(Token.new(:id, t))
		end
	end
	return tokens
end
