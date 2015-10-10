class Service
  def self.random_key
    [*'a'..'z', *'A'..'Z', *'0'..'9'].shuffle.take(8).join
  end
end