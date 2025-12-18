
require "./lexer.rb"

$i = 0
$e = []
$g = []

$p
$f = 0
$mainPresent = false

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
	$g.append('.file "code.c"')
	$g.append(".text")
	$g.append(".globl main")
	$g.append(".type main, @function")
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
	#sanity checks
	mainPresent = false
	if $e[$i] == nil
		return
	end

	if $e[$i].type == :keyword
		match(:keyword)
		if $p.value == "main"
			mainPresent = true
			$mainPresent = true
		end		

		match(:id)

		#add function start
		$g.append($p.value + ":")
		$g.append(".LFB*:".gsub("*", $f.to_s))
		$g.append(".cfi_startproc")
		$g.append("pushq %rbp")
		$g.append(".cfi_def_cfa_offset 16")
		$g.append(".cfi_offset 6, -16")
		$g.append("movq %rsp, %rbp")
		$g.append(".cfi_def_cfa_register 6")

		match(:paren)
		match(:paren)
		bracket

		$g.append(".cfi_def_cfa 7, 8")
		$g.append("ret")
		$g.append(".cfi_endproc")

		#add function end
		$g.append(".LFE*:".gsub("*", $f.to_s))
		$g.append(".size main, .-main")
		$g.append('.ident "GCC: (Debian 14.2.0-19) 14.2.0"')
		$g.append('.section .note.GNU-stack,"",@progbits')

		puts "function parsed"
		$f += 1
		function
	end
end

def statment
	returnValue
end

def returnValue
	if match(:ret)
		expresion
		$g.append("movl $*, %eax".gsub("*", $f.to_s))
		$g.append("popq %rbp")
		match(:eol)
	end
end

def expresion
	match(:int)
end

$e = createTokens("code.c")
program

puts $g
