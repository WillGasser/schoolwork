
load "TinyToken.rb"
load "TinyLexer.rb"

class Parser < Lexer
  def initialize(filename)
    super(filename)
    @error_count = 0
    advance_to_next_token()
  end

  def advance_to_next_token()
    @lookahead = nextToken()
    while @lookahead.type == Token::WS
      @lookahead = nextToken()
    end
  end

  def check_match(expected_type)
    if @lookahead.type != expected_type
      puts "Expected #{expected_type} found #{@lookahead.text}"
      @error_count += 1
    end
    advance_to_next_token()
  end

  def program()
    until @lookahead.type == Token::EOF
      puts "Entering STMT Rule"
      parse_statement()
    end
    puts "There were #{@error_count} parse errors found."
  end

  def parse_statement()
    if @lookahead.type == Token::PRINT
      puts "Found PRINT Token: #{@lookahead.text}"
      check_match(Token::PRINT)
      parse_expression()
    else
      puts "Entering ASSGN Rule"
      parse_assignment()
    end
    puts "Exiting STMT Rule"
  end

  def parse_assignment()
    if @lookahead.type == Token::ID
      puts "Found ID Token: #{@lookahead.text}"
      check_match(Token::ID)
    else
      puts "Expected id found #{@lookahead.text}"
      @error_count += 1
      advance_to_next_token()
    end
  
    if @lookahead.type == Token::ASSGN
      puts "Found ASSGN Token: #{@lookahead.text}"
      check_match(Token::ASSGN)
    else
      puts "Expected = found #{@lookahead.text}"
      @error_count += 1
      advance_to_next_token()
    end
  
    parse_expression()
    puts "Exiting ASSGN Rule"
  end
  
  def parse_expression()
    puts "Entering EXP Rule"
    parse_term()
    parse_expression_tail()
    puts "Exiting EXP Rule"
  end

  def parse_term()
    puts "Entering TERM Rule"
    parse_factor()
    parse_term_tail()
    puts "Exiting TERM Rule"
  end

  def parse_factor()
    puts "Entering FACTOR Rule"
    if @lookahead.type == Token::LPAREN
      puts "Found LPAREN Token: #{@lookahead.text}"
      check_match(Token::LPAREN)
      parse_expression()
      if @lookahead.type == Token::RPAREN
        puts "Found RPAREN Token: #{@lookahead.text}"
        check_match(Token::RPAREN)
      else
        puts "Expected ) found #{@lookahead.text}"
        @error_count += 1
        advance_to_next_token()
      end
    elsif @lookahead.type == Token::INT
      puts "Found INT Token: #{@lookahead.text}"
      check_match(Token::INT)
    elsif @lookahead.type == Token::ID
      puts "Found ID Token: #{@lookahead.text}"
      check_match(Token::ID)
    else
      puts "Expected ( or INT or ID found #{@lookahead.text}"
      @error_count += 1
      advance_to_next_token()
    end
    puts "Exiting FACTOR Rule"
  end

  def parse_term_tail()
    puts "Entering TTAIL Rule"
    if @lookahead.type == Token::MULTOP || @lookahead.type == Token::DIVOP
      if @lookahead.type == Token::MULTOP
        puts "Found MULTOP Token: #{@lookahead.text}"
        check_match(Token::MULTOP)
      elsif @lookahead.type == Token::DIVOP
        puts "Found DIVOP Token: #{@lookahead.text}"
        check_match(Token::DIVOP)
      end
      parse_factor()
      parse_term_tail()
    else
      puts "Did not find MULTOP or DIVOP Token, choosing EPSILON production"
    end
    puts "Exiting TTAIL Rule"
  end

  def parse_expression_tail()
    puts "Entering ETAIL Rule"
    if @lookahead.type == Token::ADDOP || @lookahead.type == Token::SUBOP
      if @lookahead.type == Token::ADDOP
        puts "Found ADDOP Token: #{@lookahead.text}"
        check_match(Token::ADDOP)
      elsif @lookahead.type == Token::SUBOP
        puts "Found SUBOP Token: #{@lookahead.text}"
        check_match(Token::SUBOP)
      end
      parse_term()
      parse_expression_tail()
    else
      puts "Did not find ADDOP or SUBOP Token, choosing EPSILON production"
    end
    puts "Exiting ETAIL Rule"
  end
end
