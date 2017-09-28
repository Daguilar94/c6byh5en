module Api
  module V1
    class ProductsController < ApplicationController
      protect_from_forgery with: :null_session


      def index
        {format: 'json'}
        @products = Product.all
        render json: @products
      end
    end
  end
end
