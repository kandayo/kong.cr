module Kong
  struct Error
    include JSON::Serializable

    enum Type
      InvalidPrimaryKey               =  1
      SchemaViolation                 =  2
      PrimaryKeyViolation             =  3
      ForeignKeyViolation             =  4
      UniqueViolation                 =  5
      NotFound                        =  6
      InvalidOffset                   =  7
      DatabaseError                   =  8
      InvalidSize                     =  9
      InvalidUnique                   = 10
      InvalidOptions                  = 11
      OperationUnsupported            = 12
      ForeignKeysUnresolved           = 13
      InvalidDeclarativeConfiguration = 14
      TransformationError             = 15
      InvalidForeignKey               = 16
      InvalidWorkspace                = 17
      InvalidGlobalQuery              = 18
    end

    @[JSON::Field(converter: Enum::ValueConverter(Kong::Error::Type))]
    getter code : Type
    getter name : String
    getter message : String
    getter fields : Hash(String, String)?
  end
end
