
# sample query
# (event=registration_success and msisdn=9895821948) or (event=registraion_success and type=new)


# is and =/
module QueryBuilder

  TOK_INVALID = -1
  TOK_AND   = 1
  TOK_OR    = 2
  TOK_EQUAL = 3
  TOK_NOT_EQUAL = 4
  TOK_LESS_THAN = 5
  TOK_LESS_THAN_OR_EQUAL = 6
  TOK_GREATER_THAN = 6
  TOK_GREATER_THAN_OR_EQUAL = 7
  TOK_BRACKET_LEFT = 8
  TOK_BRACKET_RIGHT = 9

  class Token
    attr_accessor :type

    def initialize(type)
      @type = type
    end
  end

  class Expression
    def eval
      {}
    end
  end

  class BinaryExpression
    def initialize(arg1, arg2, operation)
      @arg1 = arg1
      @arg2 = arg2
      @operation = operation
    end

    def eval
      case @operation
      when TOK_EQUAL then                { @arg1.eval() => @arg2.eval() }
      when TOK_NOT_EQUAL then            { "$ne" => { @arg1.eval() => @arg2.eval() } }
      when TOK_LESS_THAN then            { "$lt" => { @arg1.eval() => @arg2.eval() } }
      when TOK_LESS_THAN_OR_EQUAL then   { "$lte" => { @arg1.eval() => @arg2.eval() } }
      when TOK_GREATER_THAN then         { "$gt" => { @arg1.eval() => @arg2.eval() } }
      when TOK_GREATER_THAN_OR_EQAL then { "$gte" => { @arg1.eval() => @arg2.eval() } }
      else
        raise "InvalidBinaryOperator #{@operation}"
      end
    end
  end

  class Value
    def initialize(value)
      @value = value
    end

    def eval
      @value
    end
  end

  class AndExpression < Expression
    def initialize(*args)
      @args = args
    end

    def eval
      { "$and" => @args.map(&:eval) }
    end
  end

  class OrExpression < Expression
    def initialize(*args)
      @args = args
    end

    def eval
      { "$or" => @args.map(&:eval) }
    end
  end

  exp1 = BinaryExpression.new(Value.new('event'), Value.new('registraion_success'), TOK_EQUAL)
  exp2 = BinaryExpression.new(Value.new('status'), Value.new(true), TOK_EQUAL)
  exp3 = BinaryExpression.new(Value.new('value'), Value.new(10), TOK_LESS_THAN_OR_EQUAL)
  exp4 = AndExpression.new(exp1, exp2, exp3)
  puts exp4.eval()
  exp5 = OrExpression.new(exp1, exp2, exp3)
  puts exp5.eval()

  class RDParser

    def initialize(query_str)
      @query_str = query_str
      @current_token = nil
      @index = -1
    end

    def parse
      while next_token
      end
    end

    def next_token
      current_token = []

      case next_char
      when '(' then TOK_BRACKET_LEFT
      when ')' then TOK_BRACKET_RIGHT
      when '=' then TOK_EQUAL
      when '<' then
        c = next_char
        if c == '='
          TOK_LESS_THAN_OR_EQUAL
        elsif c == ' '
          TOK_LESS_THAN
        else
          TOK_INVALID
        end
      when '>' then TOK_GREATER_THAN
      when '<=' then TOK_LESS_THAN_OR_EQUAL
      when '>=' then TOK_GREATER_THAN_OR_EQUAL
      when 'or' || 'OR' then TOK_OR
      when 'and' || 'AND' then TOK_AND
      else
        raise "InvalidToken #{@current_token}"
      end
    end

    def next_char
      @query_str[@index + 1]
    end
  end

  class QueryBuilder
    def initialize(query_str)
      @query_str = query_str
    end

    def build
      RDParser.new(@query_str).parse
    end
  end

  q = QueryBuilder.new("event=test")
  puts q.build
end

