# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!, :set_user
  def set_user
    @user = current_user
  end

  def index
    @categories = @user.categories
  end

  def new
    @user = current_user
    @category = @user.categories.build
  end

  def create
    @user = current_user
    @category = @user.categories.build(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully.'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
