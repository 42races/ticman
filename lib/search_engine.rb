require 'singleton'

TOKENS = {
  'TOK_IS' => ['=', 'is']
}

module QueryParser
class QueryParser

  attr_reader :query_hash
  attr_reader :query_str

  def initialize(query_str)
    @query_hash = {}
    @query_str  = query_str
  end

  def parse
    query_str.
  end
end

class
class BinaryQueryE < QueryParser
  def initialize(query_str)
    @query_str = query_str
  end

  def parse
    left, right = query_str.split('=').map(&:strip)
    @query_hash.merge(left => right)
  end
end

class SearchEngine

  include Singleton

  def self.search(user_query)
     @search_engine ||= self.instance
     @search_engine.perform_search(user_query)
  end

  def perform_search(user_query)
    query_str = sanitize_query_string(user_query)
    query_hash = QueryParser.new(query_str).build
    Tic.where(query_hash)
  end

  private

  def sanitize_query_string(user_query)
    user_query.strip!
  end
end
