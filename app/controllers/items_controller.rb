class ItemsController < ApplicationController
    def index
        items = Item.all
        render json: items.as_json(include: { user: { only: [:id, :username, :city] } }, except: [:user_id, :created_at, :updated_at])
        #render json: items,except: [:created_at, :updated_at], include: :user
    end
end
