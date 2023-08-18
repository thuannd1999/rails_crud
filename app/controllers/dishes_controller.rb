class DishesController < ApplicationController
  def index
    restaurant = Restaurant.find(params[:restaurant_id])
    list_dishes = restaurant.dishes
    render json: { data: list_dishes }
  end

  def show
    @dish = Dish.find_by(params[:id])

    if @dish.nil?
      render json: { error: 'not found', status: :not_found }
    else
      render json: { data: @dish }
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish = @restaurant.dishes.new(dish_params)

    if @dish.save
      render json: { message: 'success' }, status: :created
    else
      render json: { error: @dish.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update(dish_params)
      render json: { message: 'Dish was successfully updated.' }, status: :ok
    else
      render json: { error: 'Failed to update dish.' }, status: :unprocessable_entity
    end
  end

  def destroy
    @dish = Dish.find(params[:id])

    if @dish.destroy
      render json: { message: 'Dish was successfully deleted.' }, status: :ok
    else
      render json: { error: 'Failed to delete dish.' }, status: :unprocessable_entity
    end
  end

  def dish_params
    params.require(:dish).permit(:name, :rating)
  end
end
