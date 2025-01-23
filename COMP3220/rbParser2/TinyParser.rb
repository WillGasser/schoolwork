#
#  Parser Class
#
load "TinyLexer.rb"
load "TinyToken.rb"
load "AST.rb"

class Parser < Lexer

    def initialize(filename)
        super(filename)
        consume()
    end

    def consume()
        @lookahead = nextToken()
        while(@lookahead.type == Token::WS)
            @lookahead = nextToken()
        end
    end

    def match(dtype)
        if (@lookahead.type != dtype)
            puts "Expected #{dtype} found #{@lookahead.text}"
			@errors_found+=1
        end
        consume()
    end

    def program()
    	@errors_found = 0
		
		p = AST.new(Token.new("program","program"))
		
	    while( @lookahead.type != Token::EOF)
            p.addChild(statement())
        end
        
        puts "There were #{@errors_found} parse errors found."
      
		return p
    end

    def statement()
		stmt = AST.new(Token.new("statement","statement"))
        if (@lookahead.type == Token::PRINT)
			stmt = AST.new(@lookahead)
            match(Token::PRINT)
            stmt.addChild(exp())
        else
            stmt = assign()
        end
		return stmt
    end

    def exp()
        left = term()
        return etail(left)
    end
    
    def term()
        left = factor()
        return ttail(left)
    end
    
    def factor()
        fct = nil
        if (@lookahead.type == Token::LPAREN)
            match(Token::LPAREN)
            fct = exp()
            match(Token::RPAREN)
        elsif (@lookahead.type == Token::INT)
            fct = AST.new(@lookahead)
            match(Token::INT)
        elsif (@lookahead.type == Token::ID)
            fct = AST.new(@lookahead)
            match(Token::ID)
        else
            puts "Expected ( or INT or ID found #{@lookahead.text}"
            @errors_found += 1
            consume()
        end
        return fct
    end
    
    def ttail(left)
        if (@lookahead.type == Token::MULTOP)
            op_node = AST.new(@lookahead)
            match(Token::MULTOP)
            op_node.addChild(left)
            op_node.addChild(factor())
            return ttail(op_node)
        elsif (@lookahead.type == Token::DIVOP)
            op_node = AST.new(@lookahead)
            match(Token::DIVOP)
            op_node.addChild(left)
            op_node.addChild(factor())
            return ttail(op_node)
        else
            return left
        end
    end
    
    def etail(left)
        if (@lookahead.type == Token::ADDOP)
            op_node = AST.new(@lookahead)
            match(Token::ADDOP)
            op_node.addChild(left)
            op_node.addChild(term())
            return etail(op_node)
        elsif (@lookahead.type == Token::SUBOP)
            op_node = AST.new(@lookahead)
            match(Token::SUBOP)
            op_node.addChild(left)
            op_node.addChild(term())
            return etail(op_node)
        else
            return left
        end
    end
    

    def assign()
        assgn = AST.new(Token.new("assignment","assignment"))
		if (@lookahead.type == Token::ID)
			idtok = AST.new(@lookahead)
			match(Token::ID)
			if (@lookahead.type == Token::ASSGN)
				assgn = AST.new(@lookahead)
				assgn.addChild(idtok)
            	match(Token::ASSGN)
				assgn.addChild(exp())
        	else
				match(Token::ASSGN)
			end
		else
			match(Token::ID)
        end
		return assgn
	end
end
