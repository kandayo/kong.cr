require "./kong/**"

module Kong
  class_getter(configuration) { Kong::Configuration.new }
  class_getter(client) { Kong::Client.new }

  #
  # Configuration for Kong API Wrapper.
  #
  # ```
  # Kong.configure do |config|
  #   config.backend = "http://localhost:8081/admin/api"
  # end
  # ```
  def self.configure
    yield configuration
  end
end
