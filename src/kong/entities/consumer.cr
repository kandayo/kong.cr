module Kong
  module Entities
    # The Consumer object represents a consumer - or a user - of a Service.
    struct Consumer
      include JSON::Serializable

      # The Consumer unique identifier.
      getter id : String

      @[JSON::Field(converter: Time::EpochConverter)]
      # The creation time of the Consumer.
      getter created_at : Time

      # The unique username of the Consumer.
      getter username : String?

      # Field for storing an existing unique ID for the Consumer - useful
      # for mapping Kong with users in your existing database.
      getter custom_id : String?

      # An optional set of strings associated with the Consumer for
      # grouping and filtering.
      getter tags : Array(String)
    end
  end
end
