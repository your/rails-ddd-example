module DddEasy
  class ArgumentNotProvidedError < StandardError
    def initialize(class_name, msg = "Entity \"#{class_name}\" initialised without attributes")
      super(msg)
    end
  end

  class ArgumentOutOfRangeError < StandardError
    def initialize(max_attributes, msg = "Entity attributes should not have more than #{max_attributes} properties")
      super(msg)
    end
  end

  class PropertyNotDefinedError < StandardError
    def initialize(attribute, class_name, msg = "Entity attribute \"#{attribute}\" is not defined in \"#{class_name}\"")
      super(msg)
    end
  end
end
