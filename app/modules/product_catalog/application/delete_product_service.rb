module ProductCatalog
  module Application
    class DeleteProductService
      def self.call(id:)
        repository = ProductCatalog::Persistence::ProductRepository.new
        product = repository.find_by_id(id:)
        return unless product

        product.delete
        repository.delete(product:)
      end
    end
  end
end
