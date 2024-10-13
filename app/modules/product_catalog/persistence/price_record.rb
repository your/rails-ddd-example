module ProductCatalog
  module Persistence
    class PriceRecord < ApplicationRecord
      self.table_name = "product_catalog_prices"

      belongs_to :product, class_name: "ProductCatalog::Persistence::ProductRecord", foreign_key: :product_id
    end
  end
end
