class ApiKey
  include Singleton

  def initialize
    @keys = keys
  end

  def self.key?(key)
    instance.keys.include? key
  end

  def keys
    ENV['api_keys'].split(',')
  end
end
