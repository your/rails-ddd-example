module ProductCatalog
  module Domain
    class Product < DddEasy::AggregateRoot
      attr_reader :name, :brand

      class << self
        def create(create_product_attributes: {})
          id = SecureRandom.uuid
          product = new(id:, **create_product_attributes)

          product.add_event(Events::ProductCreatedEvent.new(aggregate_id: id))

          product
        end
      end

      def delete
        add_event(Events::ProductDeletedEvent.new(aggregate_id: id))
      end

      def update(update_product_attributes: {})
        self.attributes = update_product_attributes

        add_event(Events::ProductUpdatedEvent.new(aggregate_id: id))
      end

      def update_price(update_price_attributes: {})
        amount = update_price_attributes[:amount]
        currency = update_price_attributes[:currency]

        new_price = Price.new(id: SecureRandom.uuid, amount:, currency:)
        new_price.validate

        add_event(Events::PriceUpdatedEvent.new(aggregate_id: id, amount:, currency:))

        new_price
      end
    end
  end
end
