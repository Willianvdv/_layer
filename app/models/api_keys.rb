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
      key_file['API_KEYS']
    end

    def api_key_file
      Rails.root.join('config', 'api_keys.yml')
    end

    def key_file
      YAML.load_file api_key_file
    end
end
