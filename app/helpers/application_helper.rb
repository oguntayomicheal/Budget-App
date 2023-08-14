module ApplicationHelper
  def category_products_sum(id)
    Product.where(category_id: id).sum(:amount)
  end
end
