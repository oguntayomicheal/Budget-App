# frozen_string_literal: true

class CreateCategoriesProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_products, &:timestamps
  end
end
