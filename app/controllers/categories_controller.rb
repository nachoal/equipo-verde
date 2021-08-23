class CategoriesController < ApplicationController
  def index
   @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
    raise

  end


private

def category_params
  params.require(:category).permit(:name, :description)
end

end
