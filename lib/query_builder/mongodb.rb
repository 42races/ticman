require_relative 'query_builder'

module QueryBuilder
  class Mongodb < Base
    def build
      {}
    end
  end
end

str = '''(event=registration_success and msisdn=9895821948) or (event=registraion_success and type=new)'''
builer = QueryBuilder::Mongodb.new(str)
builer.build
puts 'Printing tokens'
puts builer.tokens
puts "Query"
p builer.build