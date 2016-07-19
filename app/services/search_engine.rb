require 'singleton'

class SearchEngine

  include Singleton

  def self.search(user_query)
     @search_engine ||= self.instance
     @search_engine.perform_search(user_query)
  end

  def perform_search(user_query)
    @query_str = sanitize_query_string(user_query)
    Tic.all
  end

  private

  def sanitize_query_string(user_query)
  end
end