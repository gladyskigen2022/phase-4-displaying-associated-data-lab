class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def show
      user = User.find(params[:id])
      if user
        render json: user.as_json(include: { items: { only: [:id, :name, :description, :price] } }, except: [:created_at, :updated_at])
      else
        render_not_found_response
      end

      #render json: user,except: [:created_at, :updated_at],include: :items, status: :created 
      #render json :user.item, except: [:created_at, :updated_at], status: :created
    end
  
    private
  
    def render_not_found_response
      render json: { error: "user not found" }, status: :not_found
    end
  
  
  
end
