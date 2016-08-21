require 'singleton'
require 'query_builder'

class SearchEngine

  include Singleton

  def self.search(user_query)
     @search_engine ||= self.instance
     @search_engine.perform_search(user_query)
  end

  def perform_search(user_query)
    query_str = sanitize_query_string(user_query)
    query_hash = QueryBuilder::QueryParser.new(query_str)
    Tic.where(query_hash)
  end

  private

  def sanitize_query_string(user_query)
    user_query.strip!
  end
end
