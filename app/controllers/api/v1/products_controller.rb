module Api
  module V1
    class ProductsController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        @products = Product.all
        render json: @products
      end

      def create
        product = Product.new(safe_params)
        if product.save
          render json: product, status: 201
        else
          render json: { errors: product.errors }, status: 422
        end
      end

      def edit
        product = Product.find(params[:id])
        if product.update(safe_params)
          render json: product, status: 200
        else
          render json: {errors: product.errors}, status: 422
        end
      end

      def delete
        product = Product.find(params[:id])
        product.destroy
        head :no_content
      end

      private
      def safe_params
        params.require(:product).permit(:name, :price)
      end
    end
  end
end
