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
        recipe = params[:recipe]
       if recipe.empty?
        render json: {
          message: "Recipe creation failed!",
          required: "title, making_time, serves, ingredients, cost"
        }, status: :ok
       end

        if recipe.save
          @recipe = Recipe.find_by(cost:450)
          render json: {
            message: "Recipe successfully created!",
            recipe: [@recipe]
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

      def show
        @recipe_detail = Recipe.find_by(id: params[:id])

        render json: {
          message: "Recipe details by id",
          recipe: [@recipe_detail]
        }, status: :ok
      end

      def update
        recipe_set = Recipe.find_by(id: params[:id])
        recipe_set.update(
          "title": "トマトスープレシピ",
          "making_time": "15分",
          "serves": "5人",
          "ingredients": "玉ねぎ, トマト, スパイス, 水",
          "cost": "450"
        )
        @recipe_update = Recipe.find_by(id: params[:id])
        render json: {
          message: "Recipe successfully updated!",
          recipe: [@recipe_update]
        }, status: :ok
      end
    end
  end
end

