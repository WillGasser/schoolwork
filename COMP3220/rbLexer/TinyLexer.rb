class Lexer
    def initialize(filename)
      begin
        @f = File.open(filename, 'r:utf-8')
      rescue Errno::ENOENT
        puts "Error: file not found"
        @f = nil
        exit
      end
  
      if !@f.eof?
        @c = @f.getc()
      else
        @c = "eof"
        @f.close()
      end
    end
  
    def nextCh
      if !@f.eof?
        @c = @f.getc()
      else
        @c = "eof"
      end
      return @c
    end
  
    def nextToken
      while whitespace?(@c)
        str = ""
        while whitespace?(@c)
          str += @c
          nextCh()
        end
        return Token.new(Token::WS, str)
      end
  
      return Token.new(Token::EOF, "eof") if @c == "eof"
  
      if numeric?(@c)
        str = ""
        while numeric?(@c)
          str += @c
          nextCh()
        end
        return Token.new(Token::INT, str)
      end
  
      if letter?(@c)
        str = ""
        while letter?(@c)
          str += @c
          nextCh()
        end
        case str
        when "print"
          return Token.new(Token::PRINT, str)
        when "if"
          return Token.new(Token::IF, str)
        when "then"
          return Token.new(Token::THEN, str)
        when "while"
          return Token.new(Token::WHILE, str)
        else
          return Token.new(Token::ID, str)
        end
      end
  
      case @c
      when "+"
        nextCh()
        return Token.new(Token::ADDOP, "+")
      when "-"
        nextCh()
        return Token.new(Token::SUBOP, "-")
      when "*"
        nextCh()
        return Token.new(Token::MULTOP, "*")
      when "/"
        nextCh()
        return Token.new(Token::DIVOP, "/")
      when "="
        nextCh()
        return Token.new(Token::ASSIGN, "=")
      when "("
        nextCh()
        return Token.new(Token::LPAREN, "(")
      when ")"
        nextCh()
        return Token.new(Token::RPAREN, ")")
      when "<", ">", "&"
        comparison_op = @c
        nextCh()
        return Token.new(Token::COMPARISON_OP, comparison_op)
      else
        tok = Token.new(Token::UNKWN, @c)
        nextCh()
        return tok
      end
    end
  
    def letter?(lookAhead)
      lookAhead =~ /^[a-zA-Z]$/
    end
  
    def numeric?(lookAhead)
      lookAhead =~ /^\d+$/
    end
  
    def whitespace?(lookAhead)
      lookAhead =~ /^\s+$/
    end
  end
  