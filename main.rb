require "./lexer.rb"

$i = 0
$e = []

def match(char)
        if $e[$i].type == char
                $i += 1
		puts $e[$i]
                return
        end
end

def program
	function
end

def function
	match(:keyword)
	match(:id)
	match(:paren)
	match(:paren)
	match(:bracket)
	statment
	match(:bracket)
end

def returnValue
	if match(:ret)
		expresion
		match(:eol)
	end
end

def opperators
	if match(:opperator)
		expresion
		opperators
	end
end

def statment
	returnValue

	#arithmatic
	if match(:char)
		opperators
	end

	if match(:bracket)
		return
	else
		statment
	end
end

def expresion
	match(:literal)
end

$e = createTokens("code.txt")
program
