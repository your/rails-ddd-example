class CreateProductCatalogProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :product_catalog_products, id: :uuid do |t|
      t.string :name
      t.string :brand

      t.timestamps
    end
  end
end
