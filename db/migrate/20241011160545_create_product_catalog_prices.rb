class CreateProductCatalogPrices < ActiveRecord::Migration[8.0]
  def change
    create_table :product_catalog_prices, id: :uuid do |t|
      t.float :amount
      t.string :currency
      t.datetime :effective_date
      t.references :product, null: false, foreign_key: { to_table: :product_catalog_products }, type: :uuid

      t.timestamps
    end
  end
end
