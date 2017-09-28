module Api
  module V1
    class ProductsController < ApplicationController
      protect_from_forgery with: :null_session
      {format: 'json'}

      def index
        @products = Product.all
        render json: @products
      end
    end
  end
end
