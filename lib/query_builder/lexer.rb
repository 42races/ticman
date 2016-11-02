
# line 1 "lexer.rl"
module Lexer


# line 60 "lexer.rl"



def run_lexer(data)
  data = data.unpack("c*") if(data.is_a?(String))
  eof = data.length
  token_array = []

  
# line 17 "lexer.rb"
class << self
	attr_accessor :_query_lexer_actions
	private :_query_lexer_actions, :_query_lexer_actions=
end
self._query_lexer_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	7, 1, 8, 1, 9, 1, 10, 1, 
	11, 1, 12, 1, 13, 1, 14, 1, 
	15, 1, 16, 1, 17, 2, 2, 3, 
	2, 2, 4, 2, 2, 5, 2, 2, 
	6
]

class << self
	attr_accessor :_query_lexer_key_offsets
	private :_query_lexer_key_offsets, :_query_lexer_key_offsets=
end
self._query_lexer_key_offsets = [
	0, 1, 3, 6, 10, 28, 29, 31, 
	34, 36, 37, 41, 44, 47
]

class << self
	attr_accessor :_query_lexer_trans_keys
	private :_query_lexer_trans_keys, :_query_lexer_trans_keys=
end
self._query_lexer_trans_keys = [
	34, 48, 57, 95, 97, 122, 95, 100, 
	97, 122, 32, 33, 34, 43, 45, 61, 
	97, 111, 9, 13, 40, 41, 48, 57, 
	60, 62, 98, 122, 34, 48, 57, 46, 
	48, 57, 48, 57, 61, 95, 110, 97, 
	122, 95, 97, 122, 95, 97, 122, 95, 
	114, 97, 122, 0
]

class << self
	attr_accessor :_query_lexer_single_lengths
	private :_query_lexer_single_lengths, :_query_lexer_single_lengths=
end
self._query_lexer_single_lengths = [
	1, 0, 1, 2, 8, 1, 0, 1, 
	0, 1, 2, 1, 1, 2
]

class << self
	attr_accessor :_query_lexer_range_lengths
	private :_query_lexer_range_lengths, :_query_lexer_range_lengths=
end
self._query_lexer_range_lengths = [
	0, 1, 1, 1, 5, 0, 1, 1, 
	1, 0, 1, 1, 1, 1
]

class << self
	attr_accessor :_query_lexer_index_offsets
	private :_query_lexer_index_offsets, :_query_lexer_index_offsets=
end
self._query_lexer_index_offsets = [
	0, 2, 4, 7, 11, 25, 27, 29, 
	32, 34, 36, 40, 43, 46
]

class << self
	attr_accessor :_query_lexer_trans_targs
	private :_query_lexer_trans_targs, :_query_lexer_trans_targs=
end
self._query_lexer_trans_targs = [
	5, 0, 8, 4, 2, 11, 4, 2, 
	11, 11, 4, 4, 4, 5, 6, 6, 
	4, 10, 13, 4, 4, 7, 9, 12, 
	4, 5, 0, 7, 4, 1, 7, 4, 
	8, 4, 4, 4, 2, 3, 2, 4, 
	2, 11, 4, 2, 2, 4, 2, 11, 
	2, 4, 4, 4, 4, 4, 4, 4, 
	4, 4, 4, 4, 4, 4, 4, 0
]

class << self
	attr_accessor :_query_lexer_trans_actions
	private :_query_lexer_trans_actions, :_query_lexer_trans_actions=
end
self._query_lexer_trans_actions = [
	29, 0, 0, 23, 0, 35, 27, 0, 
	32, 35, 25, 7, 11, 38, 0, 0, 
	11, 38, 38, 7, 9, 5, 0, 38, 
	13, 29, 0, 5, 21, 0, 5, 15, 
	0, 17, 11, 19, 0, 0, 0, 21, 
	0, 35, 27, 0, 0, 21, 0, 32, 
	0, 21, 27, 23, 27, 25, 27, 21, 
	15, 17, 19, 21, 27, 21, 21, 0
]

class << self
	attr_accessor :_query_lexer_to_state_actions
	private :_query_lexer_to_state_actions, :_query_lexer_to_state_actions=
end
self._query_lexer_to_state_actions = [
	0, 0, 0, 0, 1, 0, 0, 0, 
	0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_query_lexer_from_state_actions
	private :_query_lexer_from_state_actions, :_query_lexer_from_state_actions=
end
self._query_lexer_from_state_actions = [
	0, 0, 0, 0, 3, 0, 0, 0, 
	0, 0, 0, 0, 0, 0
]

class << self
	attr_accessor :_query_lexer_eof_trans
	private :_query_lexer_eof_trans, :_query_lexer_eof_trans=
end
self._query_lexer_eof_trans = [
	61, 52, 61, 54, 0, 61, 63, 57, 
	58, 59, 63, 61, 63, 63
]

class << self
	attr_accessor :query_lexer_start
end
self.query_lexer_start = 4;
class << self
	attr_accessor :query_lexer_first_final
end
self.query_lexer_first_final = 4;
class << self
	attr_accessor :query_lexer_error
end
self.query_lexer_error = -1;

class << self
	attr_accessor :query_lexer_en_main
end
self.query_lexer_en_main = 4;


# line 69 "lexer.rl"
  
# line 159 "lexer.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = query_lexer_start
	ts = nil
	te = nil
	act = 0
end

# line 70 "lexer.rl"
  
# line 171 "lexer.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	end
	if _goto_level <= _resume
	_acts = _query_lexer_from_state_actions[cs]
	_nacts = _query_lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _query_lexer_actions[_acts - 1]
			when 1 then
# line 1 "NONE"
		begin
ts = p
		end
# line 201 "lexer.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _query_lexer_key_offsets[cs]
	_trans = _query_lexer_index_offsets[cs]
	_klen = _query_lexer_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p].ord < _query_lexer_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p].ord > _query_lexer_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _query_lexer_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p].ord < _query_lexer_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p].ord > _query_lexer_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	end
	if _goto_level <= _eof_trans
	cs = _query_lexer_trans_targs[_trans]
	if _query_lexer_trans_actions[_trans] != 0
		_acts = _query_lexer_trans_actions[_trans]
		_nacts = _query_lexer_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _query_lexer_actions[_acts - 1]
when 2 then
# line 1 "NONE"
		begin
te = p+1
		end
when 3 then
# line 28 "lexer.rl"
		begin
act = 4;		end
when 4 then
# line 43 "lexer.rl"
		begin
act = 7;		end
when 5 then
# line 48 "lexer.rl"
		begin
act = 8;		end
when 6 then
# line 53 "lexer.rl"
		begin
act = 9;		end
when 7 then
# line 16 "lexer.rl"
		begin
te = p+1
		end
when 8 then
# line 33 "lexer.rl"
		begin
te = p+1
 begin 
      value = data[ts...te].pack("c*")
      emit(:punctuation, value)
     end
		end
when 9 then
# line 38 "lexer.rl"
		begin
te = p+1
 begin 
      value = data[ts...te].pack("c*")
      emit(:operator, value)
     end
		end
when 10 then
# line 53 "lexer.rl"
		begin
te = p+1
 begin 
      value = data[ts...te].pack("c*")
      raise "Invalid character sequence #{value}"
     end
		end
when 11 then
# line 18 "lexer.rl"
		begin
te = p
p = p - 1; begin 
      value = data[ts...te].pack("c*").to_i
      emit(:integer, value)
     end
		end
when 12 then
# line 23 "lexer.rl"
		begin
te = p
p = p - 1; begin 
      value = data[ts...te].pack("c*").to_f
      emit(:float, value)
     end
		end
when 13 then
# line 38 "lexer.rl"
		begin
te = p
p = p - 1; begin 
      value = data[ts...te].pack("c*")
      emit(:operator, value)
     end
		end
when 14 then
# line 53 "lexer.rl"
		begin
te = p
p = p - 1; begin 
      value = data[ts...te].pack("c*")
      raise "Invalid character sequence #{value}"
     end
		end
when 15 then
# line 18 "lexer.rl"
		begin
 begin p = ((te))-1; end
 begin 
      value = data[ts...te].pack("c*").to_i
      emit(:integer, value)
     end
		end
when 16 then
# line 53 "lexer.rl"
		begin
 begin p = ((te))-1; end
 begin 
      value = data[ts...te].pack("c*")
      raise "Invalid character sequence #{value}"
     end
		end
when 17 then
# line 1 "NONE"
		begin
	case act
	when 4 then
	begin begin p = ((te))-1; end

      value = data[ts...te].pack("c*")
      emit(:string, value)
    end
	when 7 then
	begin begin p = ((te))-1; end

      value = data[ts...te].pack("c*")
      emit(:keyword, value)
    end
	when 8 then
	begin begin p = ((te))-1; end

      value = data[ts...te].pack("c*")
      emit(:key, value)
    end
	when 9 then
	begin begin p = ((te))-1; end

      value = data[ts...te].pack("c*")
      raise "Invalid character sequence #{value}"
    end
end 
			end
# line 404 "lexer.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _query_lexer_to_state_actions[cs]
	_nacts = _query_lexer_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _query_lexer_actions[_acts - 1]
when 0 then
# line 1 "NONE"
		begin
ts = nil;		end
# line 424 "lexer.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	if _query_lexer_eof_trans[cs] > 0
		_trans = _query_lexer_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end

# line 71 "lexer.rl"
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