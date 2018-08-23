class ProductsController < ApplicationController

    def index
        @search = Product.search(params[:q])
        @products = @search.result.all

        if params[:order]
            @products = Product.order(price: params[:order])  
        end
    end

    def new
        @product = Product.new
    end

    def show
        @product = authorize Product.find(params[:id])
    end
        
    def create
        @product = Product.new(product_params)
        @category = Category.find(params[:product][:categories])

        if @product.save
            @product.categories << @category
            redirect_to @product
        else
            render 'new'
        end
    end
    def update
        @product = Product.find(params[:id])

        if @product.update(product_params)
            redirect_to [:admin, @product]
        else
            render 'edit'
        end
    end 
    private
    def product_params
        params.require(:product).permit(:name, :description, :images, :price)
    end
end
