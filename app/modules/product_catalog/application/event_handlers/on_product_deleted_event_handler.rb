module ProductCatalog
  module EventHandler
    class OnProductDeleteEventHandler < DddEasy::EventHandler
      def handle
        update_price_list
      end

      private

      def update_price_list
        product = Domain::Product.find_by_id(id: event.aggregate_id)
        return unless product

        repository = Persistence::PriceListRepository.new
        repository.delete(product:)
      end
    end
  end
end
