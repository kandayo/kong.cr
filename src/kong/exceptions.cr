module Kong
  class ApiError < Exception
    getter wrapped_error : Kong::Error? = nil

    def initialize(@wrapped_error)
    end

    def message
      if error = wrapped_error
        error.message
      end
    end
  end
end
