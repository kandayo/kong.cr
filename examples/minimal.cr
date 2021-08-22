require "../src/kong"

Kong.configure do |config|
  config.base_url = "http://localhost:8001"
end

Kong::Consumer.create(
  username: "MyConsumer",
  custom_id: "1",
  tags: ["tag1", "tag2"]
)
