class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :category_products, dependent: :destroy
  has_many :categories, through: :category_products

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
