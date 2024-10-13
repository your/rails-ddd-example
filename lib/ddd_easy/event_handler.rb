module DddEasy
  class EventHandler
    def initialize(event:)
      @event = event
    end

    def handle
      raise "\"handle\" method needs to be implement"
    end

    private

    attr_reader :event
  end
end
