class RenameCategoriesProductsToCategoryProducts < ActiveRecord::Migration[7.0]
  def change
    rename_table :categories_products, :category_products

    rename_column :category_products, :categories_id, :category_id
    rename_column :category_products, :products_id, :product_id
  end
end
