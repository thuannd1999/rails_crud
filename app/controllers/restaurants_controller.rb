class RestaurantsController < ApplicationController
  def index
    list_restaurants = Restaurant.all
    render json: { data: list_restaurants }
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])

    if @restaurant.nil?
      render json: { error: 'not found' }, status: :not_found
    else
      render json: { data: @restaurant }
    end
  end

  def create
    p restaurant_params
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      render json: { message: 'success' }, status: :created
    else
      render json: { error: @restaurant.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      render json: { message: 'Restaurant was successfully updated.' }, status: :ok
    else
      render json: { error: 'Failed to update restaurant.' }, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.destroy
      render json: { message: 'Restaurant was successfully deleted.' }, status: :ok
    else
      render json: { error: 'Failed to delete restaurant.' }, status: :unprocessable_entity
    end
  end
end
