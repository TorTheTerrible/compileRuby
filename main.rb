
require "./lexer.rb"

$i = 0
$e = []
$g = []

$p

def match(char)
	unless $e[$i]
		return
	end
	
        if $e[$i].type == char
                puts $e[$i]
		$p = $e[$i]
		$i += 1
                return true
        else
		#puts "error " + $e[$i].value
		return
	end
end

def program
	function
end

def bracket
	if match(:bracket)
		while !match(:bracket) do
			statment
		end
	end
end

def function
	if match(:keyword)
		match(:id)
		match(:paren)
		match(:paren)
		bracket

		puts "function parsed"
		function
	end
end

def statment
	returnValue
end

def returnValue
	if match(:ret)
		expresion
		$g.append("mov eax, " + $p.value)
		match(:eol)
		$g.append("ret")
	end
end

def expresion
	match(:int)
end

$e = createTokens("code.txt")
program
puts $g
