module Api
  module V1
    class RecipesController < ApplicationController
      def index
        recipes = Recipe.all

        render json: {
          recipes: recipes
        }, status: :ok
      end
    end
  end
end
