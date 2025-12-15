def operatorE()
	if e[i] == "keyword"
		match("keybword")
		operatorEE()
	end
end

def operatorEE()
	match("operator")
	match("int-literal")

	if e[i] == "semicolon"
		match("semicolon")
		return
	end
	puts "error"
	exit
end
