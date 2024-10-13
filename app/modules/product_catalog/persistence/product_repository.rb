module ProductCatalog
  module Persistence
    class ProductRepository
      def save(product:, price: nil)
        product_record = ProductRecord.find_by(id: product.id) || ProductRecord.new
        product_record.assign_attributes(product.attributes)
        product_record.prices << PriceRecord.new(price.attributes) if price
        product_record.transaction do
          product_record.id = product.id
          product_record.save!
          product.publish_events(Rails.logger, nil)
          return true
        end
        false
      end

      def find_by_id(id:)
        product_record = ProductRecord.find_by(id:)
        return unless product_record

        to_domain(product_record)
      end

      def delete(product:)
        product_record = ProductRecord.find_by(id: product.id)
        return unless product_record

        product_record.transaction do
          product_record.destroy!
          product.publish_events(Rails.logger, nil)
          return true
        end
        false
      end

      private

      def to_domain(product_record)
        Domain::Product.new(id: product_record.id, **product_record.attributes)
      end
    end
  end
end
