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

      private
      def safe_params
        params.require(:product).permit(:name, :price)
      end
    end
  end
end
