require "./match.rb"
require "./lexer.rb"
require "./operators.rb"
require "./function.rb"

e = createTokens("code.txt")
puts e
