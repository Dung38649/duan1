class ProductsController < ApplicationController

    def index
        @search = Product.search(params[:q])
        @products = @search.result.paginate(:page => params[:page], :per_page => 6).order ( ' id DESC ' )
        # @products = Product.paginate(:page => params[:page], :per_page => 6).order('created_at desc')
        if params[:order]
            @products = Product.order(price: params[:order]).paginate(:page => params[:page], :per_page => 6)
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
        @category = Category.find(params[:product][:categories])

        if @product.update(product_params)
            @product.categories.delete_all  
            @product.categories << @category
            redirect_to @product
        else
            render 'edit'
        end
    end 
    private
    def product_params
        params.require(:product).permit(:name, :description, :price, {images: []})
    end
end
