class AddRefCategoryProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories_products, :categories, null: false, foreign_key: true
    add_reference :categories_products, :products, null: false, foreign_key: true
  end
end
