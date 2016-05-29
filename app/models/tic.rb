class Tic
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  paginates_per 50

  field :event, type: String
  field :trace_id, type: Integer

  index({ event: 1 })
  index({ created_at: 1 })
  index({ trace_id: 1 })

  validates :event, presence: true
  validates :trace_id, presence: true
end