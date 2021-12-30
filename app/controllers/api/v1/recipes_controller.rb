module Api
  module V1
    class RecipesController < ApplicationController
      rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing

      def create
        recipe = Recipe.new(user_search_params)
        if recipe.save
          render json: {
            message: "Recipe successfully created!",
            recipe: recipe
          }, status: :ok
        else
          render json: {
            message: "Recipe creation failed!",
            required: "title, making_time, serves, ingredients, cost"
          }, status: :ok
        end
      end

      def index
        recipes = Recipe.all

        render json: {
          recipes: recipes
        }, status: :ok
      end

      def user_search_params
        params.require(:title, :making_time, :serve, :ingredients, :cost)
        params.permit(:title, :making_time, :serve, :ingredients, :cost)
      end
    
      def handle_parameter_missing(e)
        render json: { message: e.original_message }, status: 200
      end
    end
  end
end
