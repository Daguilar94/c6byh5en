module Api
  module V1
    class ProductsController < ApplicationController
      {format: 'json'}
      def index
        render json: Product.all
      end
    end
  end
end
