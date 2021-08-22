require "http/client"
require "json"

module Kong
  class Client
    private getter configuration
    private getter connection

    def initialize(@configuration = Kong.configuration)
      unless backend = configuration.backend
        raise ArgumentError.new("Kong API Wrapper is not configured")
      end

      base_uri = URI.parse(backend)

      @connection = HTTP::Client.new(base_uri) do |client|
        client.before_request do |request|
          request.headers["Content-Type"] = "application/json"
          request.headers["Accept"] = "application/json"
        end

        client.connect_timeout = configuration.connect_timeout
        client.read_timeout = configuration.read_timeout

        client
      end
    end

    {% for verb in %i[get head] %}
      def {{verb.id}}(route : String, params : Hash(String, String))
        response = connection.{{verb.id}}(route, form: params)
        parse_response(response)
        response.body
      end
    {% end %}

    {% for verb in %i[post put patch delete] %}
      def {{verb.id}}(route : String, params : Hash?)
        response = connection.{{verb.id}}(route, body: params.to_json)
        parse_response(response)
        response.body
      end
    {% end %}

    private def parse_response(response)
      return if response.success?

      wrapped_error = begin
        Error.from_json(response.body)
      rescue JSON::SerializableError
        nil
      end

      raise ApiError.new(wrapped_error)
    end
  end
end
