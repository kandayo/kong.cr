module Kong
  class Configuration
    property backend : String?
    property connect_timeout : Time::Span = 1.second
    property read_timeout : Time::Span = 5.seconds
  end
end
