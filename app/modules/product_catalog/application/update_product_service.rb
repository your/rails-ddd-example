module ProductCatalog
  module Application
    class UpdateProductService
      def self.call(id:, update_product_attributes: {})
        repository = ProductCatalog::Persistence::ProductRepository.new
        product = repository.find_by_id(id:)
        return unless product

        product.update(update_product_attributes:)
        repository.save(product:)
      end
    end
  end
end
