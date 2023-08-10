class ProductsController < ApplicationController
  before_action :set_category
  def set_category
    @category = Category.find(params[:category_id])
  end

  def new
    @product = @category.products.build
  end

  def create
    @product = @category.products.build(product_params)
    @product.user_id = current_user.id
    @product.user = current_user

    if @product.save
      redirect_to category_products_path(@category), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def product_params
    params.require(:product).permit(:name, :amount)
  end

  def index
  end
end
