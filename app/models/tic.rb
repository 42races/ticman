class Tic
  include Mongoid::Document

  paginates_per 50
end