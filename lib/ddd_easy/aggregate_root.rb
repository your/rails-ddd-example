module DddEasy
  class AggregateRoot < Entity
    def initialize(id:, **_attributes)
      super
      @domain_events = []
    end

    def domain_events
      @domain_events
    end

    def add_event(domain_event)
      @domain_events << domain_event
    end

    def clear_events
      @domain_events = []
    end

    def publish_events(logger, _event_emitter)
      domain_events.each do |event|
        logger.debug("\"#{event.class.name}\" event published for aggregate #{self.class.name} : #{id}")
        # TODO: publish somewhere
      end
      clear_events
    end
  end
end
