module DddEasy
  class Event
    attr_reader :id
    attr_reader :aggregate_id # This is from the domain where the event occurred

    def initialize(aggregate_id:)
      @id = SecureRandom.uuid
      @aggregate_id = aggregate_id
    end
  end
end
