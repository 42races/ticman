class Service
  def self.random_key
    [*'a'..'z', *'A'..'Z', *'0'..'9'].shuffle.take(8).join
  end

  def self.reference_code(str)
    token = Digest::SHA1.hexdigest(str) + SecureRandom.uuid.gsub('-', '')
  end
end