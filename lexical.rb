
contents
step = 0

def consumeChar()
  temp = []
  
  if contents[i] = "(",")"
    temp.append(contents[i])
    return temp
  end
  
  while true
    if contents[i] != " ","(",")"
      temp.append(contents[i])
      step += 1
    else
      step += 1
      break
    end
  end
  return temp
end

def lex()
  while true
    temp = consumeChar()
    
    if temp == "(" or if temp == ")"
      tokens.append("()")
    else

    if temp == ";"
      tokens.append(";")
    else

    if temp == "if"
      tokenss.append("if")
    else
      tokens.append("id")
    end  
  end
end

def identifier()
  if contents[step] = letter
    ident
  end
end

def keyword()
  
end

def number()

end

def opperator()

end

def generateTokens()
  tokens = []
  
  #generate the tokens
  while loop
    tokens.append("identifier")

  end
end
