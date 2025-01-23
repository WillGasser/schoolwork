class Token

  EOF = "eof"
  LPAREN = "("
  RPAREN = ")"
  ADDOP = "+"
  SUBOP = "-"
  MULTOP = "*"
  DIVOP = "/"
  ASSIGN = "="
  PRINT = "print"
  IF = "if"
  THEN = "then"
  WHILE = "while"
  COMPARISON_OP = "comparison_op"
  ID = "identifier"
  INT = "integer"
  WS = "whitespace"
  UNKWN = "unknown"


  def initialize(type, text)
    @type = type
    @text = text
  end


  def get_type
    @type
  end


  def get_text
    @text
  end


  def to_s
    "#{@type} #{@text}"
  end
end
