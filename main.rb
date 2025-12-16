require "./lexer.rb"

i = 0
e = []

def match(char)
        if e[i].keyword == :char
                i += 1
                return
        end
        puts "error"
        exit
end

def program
	function
end

def function
	match(keyword)
	match(id)
	match(paren)
	match(paren)
	match(bracket)
	statment
	match(bracket)
end

def statment
	match(ret)
	expresion
	match(eol)
end

def expresion
	match(int)
end

e = createTokens("code.txt")
puts e

