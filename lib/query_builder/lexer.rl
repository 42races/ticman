module Lexer

%%{

  machine query_lexer;

  integer = ('+'|'-')?[0-9]+;
  float   = ('+'|'-')?[0-9]+'.'[0-9]+;
  string  = '"'any*'"';
  punctuation = '(' | ')';
  operator = '<' | '>' | '<=' | '>=' | '=' | '!';
  keyword = ('and' | 'or');
  field = lower(lower|'_')+lower;

  main := |*
    space;

    integer => {
      value = data[ts...te].pack("c*").to_i
      emit(:integer, value)
    };

    float => {
      value = data[ts...te].pack("c*").to_f
      emit(:float, value)
    };

    string => {
      value = data[ts...te].pack("c*")
      emit(:string, value)
    };

    punctuation => {
      value = data[ts...te].pack("c*")
      emit(:punctuation, value)
    };

    operator => {
      value = data[ts...te].pack("c*")
      emit(:operator, value)
    };

    keyword => {
      value = data[ts...te].pack("c*")
      emit(:keyword, value)
    };

    field => {
      value = data[ts...te].pack("c*")
      emit(:key, value)
    };

    any => {
      value = data[ts...te].pack("c*")
      raise "Invalid character sequence #{value}"
    };

  *|;

}%%


def run_lexer(data)
  data = data.unpack("c*") if(data.is_a?(String))
  eof = data.length
  token_array = []

  %% write data;
  %% write init;
  %% write exec;
end

def emit(token_type, value)
  # @override this method in the included class
  # Collect tokens in an array of tokens

  tok_data = {
    token_type: token_type,
    value: value
  }

  puts tok_data
end

end