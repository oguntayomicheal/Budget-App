# frozen_string_literal: true

class AddForeignKeyToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :users, null: false, foreign_key: true
  end
end
