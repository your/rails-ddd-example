module DddEasy
  class Entity
    attr_reader :id, :created_at, :updated_at

    def initialize(id:, **attributes)
      @id = id
      @attributes = {}

      validate_attributes(attributes)
      set_attributes(attributes)

      validate
    end

    def attributes
      { id:, **@attributes }
    end

    def attributes=(attrs)
      @attributes.merge!(attrs.symbolize_keys.except(%i[id created_at]))
    end

    # There are certain rules (invariants) that must always hold true for each entity.
    # The `validate` method is called before saving an entity to the database
    # to ensure that these rules are respected.
    def validate
    end

    def ==(other)
      return false unless other.is_a?(self.class)
      id == other.id
    end

    private

    MAX_ATTRIBUTES = 50

    def validate_attributes(attributes)
      raise ArgumentNotProvidedError.new(self.class.name) if attributes.nil? || attributes.empty?
      raise ArgumentOutOfRangeError.new(MAX_ATTRIBUTES) if attributes.size > MAX_ATTRIBUTES
    end

    def set_attributes(attributes)
      attributes.symbolize_keys.except(*%i[id created_at updated_at]).each do |(k, v)|
        @attributes.merge!(k => v)
        if respond_to?("#{k}")
          instance_variable_set("@#{k}", v)
        else
          raise PropertyNotDefinedError.new(k, self.class.name)
        end
      end

      now = Time.current
      @created_at = attributes[:created_at] || now
      @updated_at = attributes[:updated_at] || now
    end
  end
end
