module ProductCatalog
  module Domain
    module Events
      class PriceUpdatedEvent < DddEasy::Event
        attr_reader :amount, :currency

        def initialize(aggregate_id:, amount:, currency:)
          @amount = amount
          @currency = currency
          super(aggregate_id:)
        end
      end
    end
  end
end
