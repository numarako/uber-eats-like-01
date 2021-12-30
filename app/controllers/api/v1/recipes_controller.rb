module Api
  module V1
    class RecipesController < ApplicationController
      def create
        recipe = Recipe.new(
          "id": params[:id],
          "title": params[:title],
          "making_time": params[:making_time],
          "serves": params[:serves],
          "ingredients": params[:ingredients],
          "cost": params[:cost],
          "created_at": params[:created_at],
          "updated_at": params[:updated_at]
        )
        title = params[:title]
       if title.nil?
        render json: {
          message: "Recipe creation failed!",
          required: "title, making_time, serves, ingredients, cost"
        }, status: :ok
       end

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

      def show
        recipe = Recipe.find_by(id: params[:id])

        render json: {
          message: "Recipe details by id",
          recipe: recipe
        }, status: :ok
      end


    end
  end
end
