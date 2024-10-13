module ProductCatalog
  module Application
    class AddProductService
      def self.call(create_product_attributes: {})
        product = Domain::Product.create(create_product_attributes:)
        product_repository = ProductCatalog::Persistence::ProductRepository.new
        product_repository.save(product:)
      end
    end
  end
end
