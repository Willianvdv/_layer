class ApiKey
  include Singleton

  def initialize
    @keys = keys
  end

  def self.key?(key)
    instance.keys.include? key
  end

  def self.power_user?(key)
    instance.power_user_keys.include? key
  end

  def power_user_keys
    ENV['power_user_api_keys'].split(',')
  end

  def keys
    ENV['api_keys'].split(',')
  end
end
