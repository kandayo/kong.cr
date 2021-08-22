module Kong
  module Consumer
    extend self

    def create(username : String?, custom_id : String? = nil, tags = [] of String)
      if username.nil? && custom_id.nil?
        raise ArgumentError.new("Expected an username or an custom_id")
      end

      params = {
        "username"  => username,
        "custom_id" => custom_id,
        "tags"      => tags,
      }

      payload = Kong.client.post("/consumers", params: params)

      Kong::Entities::Consumer.from_json(payload)
    end
  end
end
