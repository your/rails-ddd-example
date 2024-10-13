module ProductCatalog
  module Application
    class UpdatePriceService
      def self.call(id:, update_price_attributes: {})
        repository = ProductCatalog::Persistence::ProductRepository.new
        product = repository.find_by_id(id:)
        return unless product

        new_price = product.update_price(update_price_attributes:)

        repository.save(product:, price: new_price)
      end
    end
  end
end
