# Kong

[![Built with Crystal 1.1.1](https://img.shields.io/badge/Crystal-1.1.1-%23333333)](https://crystal-lang.org/)
[![GitHub release](https://img.shields.io/github/release/kandayo/kong.cr.svg?label=Release)](https://github.com/kandayo/kong.cr/releases)
[![Unit Tests](https://github.com/kandayo/kong.cr/workflows/CI/badge.svg)](https://github.com/kandayo/kong.cr/actions)

Kong API wrapper for Crystal.

**Work in progress.**

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     kong:
       github: kandayo/kong.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "kong"

Kong.configure do |config|
  config.backend = "http://localhost:8081/admin/api"
end

consumer = Kong::Consumer.create(custom_id: "1", tags: ["storefront"])

consumer.id        # => "4f03f5b2-1a0a-4c05-8160-f3caa8809efa"
consumer.custom_id # => "1"
consumer.tags      # => ["storefont"]
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/kandayo/kong/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [kandayo](https://github.com/kandayo) - creator and maintainer
