class ProductsController < ApplicationController


    def create
        # raise params.inspect

        @product = Product.new(product_params)

        respond_to do |format|
            if @product.save
              format.html { redirect_to @product.category, notice: 'product was successfully created.' }
              format.json { render :show, status: :created, location: @category }
            else
              format.html { render :new }
              format.json { render json: @product.errors, status: :unprocessable_entity }
            end
          end

    end

    def destroy
        @product.destroy
        respond_to do |format|
          format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
          format.json { head :no_content }
        end
      end


    def product_params
        params.require(:product).permit(:name, :price, :category_id)
    end


end
