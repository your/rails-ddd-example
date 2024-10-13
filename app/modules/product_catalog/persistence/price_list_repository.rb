module ProductCatalog
  module Persistence
    class PriceListRepository
      def save(product:, price: nil)
        product_record = ProductRecord.find_by(id: product.id)
        return false unless product_record

        price_list_record = PriceListRecord.find_or_initialize_by(product_id: product_record.id)
        price_list_record.assign_attributes({
          name: product_record.name,
          brand: product_record.brand,
          price: product_record.prices.last&.amount
        })
        price_list_record.save!
      end

      def delete(product:)
        price_list_record = PriceListRecord.find_by(id: product.id)
        return unless price_list_record

        price_list_record.destroy!
      end
    end
  end
end
