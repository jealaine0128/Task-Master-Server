module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_category, only: [:show, :update, :destroy]

      # GET /api/v1/categories
      def index
        categories = current_user.categories
        render json: categories
      end

      # GET /api/v1/categories
      def show
        render json: @category
      end

      # POST /api/v1/categories
      def create
        category = current_user.categories.build(category_params)
        
        if category.save
          render json: category, status: :created
        else
          render json: category.errors, status: :unprocessable_entity
        end
      end

      # PATCH /api/v1/categories
      def update
        if @category.update(category_params)
          render json: @category
        else
          render json: @category.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/categories
      def destroy
        @category.destroy
        render json: { message: 'Category deleted successfully' }
      end

      private

      def set_category
        @category = current_user.categories.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Category not found' }, status: :not_found
      end

      def category_params
        params.require(:category).permit(:name)
      end
    end
  end
end
