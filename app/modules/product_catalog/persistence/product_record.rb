module ProductCatalog
  module Persistence
    class ProductRecord < ApplicationRecord
      self.table_name = "product_catalog_products"

      has_many :prices, class_name: "ProductCatalog::Persistence::PriceRecord", foreign_key: :product_id
    end
  end
end
