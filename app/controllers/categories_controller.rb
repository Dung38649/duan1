class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @products = @category.products.paginate(:page => params[:page], :per_page => 6)
  end
end
