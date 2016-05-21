class Tic
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  paginates_per 50

  field :event, type: String
  field :trace_id, type: Integer

  index({ event: 1 })
  index({ created_at: 1 })
end