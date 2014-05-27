class ApiKeys
  include Singleton

  def initialize
    @keys = keys
  end

  def include?(key)
    @keys.include? key
  end

  private

  def keys
    ENV['api_keys'].split(',')
  end
end
