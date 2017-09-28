module Api
  module V1
    class ProductsController < ApplicationController

      def index
        {format: 'json'}
        render json: Product.all
      end
    end
  end
end
