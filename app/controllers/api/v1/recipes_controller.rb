module Api
  module V1
    class RecipesController < ApplicationController
      def create
        recipe = Recipe.new(
          "title": params[:title],
          "making_time": params[:making_time],
          "serves": params[:serves],
          "ingredients": params[:ingredients],
          "cost": params[:cost],
        )
        if recipe.save
          render json: {
            message: "Recipe successfully created!",
            recipe: recipe
          }, status: :200
        else
          render json: {
            message: "Recipe creation failed!",
            required: "title, making_time, serves, ingredients, cost"
          }, status: :200
        end
      end

      def index
        recipes = Recipe.all

        render json: {
          recipes: recipes
        }, status: :ok
      end
    end
  end
end