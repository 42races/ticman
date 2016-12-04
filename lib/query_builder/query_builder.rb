require_relative 'lexer'
# sample query
# (event=registration_success and msisdn=9895821948) or (event=registraion_success and type=new)

module QueryBuilder
  class Base

    include Lexer

    attr_accessor :tokens

    def initialize(query_str)
      @query_str = query_str
      @tokens = []
      tokenize!
    end

    def build
      {}
    end

    def tokenize!
      run_lexer(@query_str)
    end

    def emit(token_type, value)
      @tokens << {
        token_type: token_type,
        value: value
      }
    end
  end
end
