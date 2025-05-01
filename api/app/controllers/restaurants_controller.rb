class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all # ORM method to create instance variable
        render json: @restaurants
    end
    
    def create # enforces name and cusine through model validations
        @restaurant = Restaurant.new(restaurant_params)

        #classic 
        if @restaurant.save
            render json: @restaurant, status: :created
        else
            render json: { errors: @restaurant.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def search # our custom end point
        if params[:cuisine_type].present?
            @restaurants = Restaurant.where(cuisine_type: params[:cuisine_type])
            render json: @restaurants
        else
            render json: { error: "cuisine_type parameter is required" }, status: :bad_request
        end
    end

    private
    def restaurant_params
        params.permit(:name, :address, :cuisine_type)
    end
end


#   - `GET /restaurants`: List all restaurants (include `id`, `name`, `address`, `cuisine_type`). 
#   - `POST /restaurants`: Add a new restaurant (validate required fields: `name`, `cuisine_type`). 
#   - Add a custom endpoint `GET /restaurants/search?cuisine_type=<type>` to filter by cuisine. 
