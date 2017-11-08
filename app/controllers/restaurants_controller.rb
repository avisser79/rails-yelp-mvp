class RestaurantsController < ApplicationController
  def index         # GET /restaurants
    @restaurants = Restaurant.all
  end

  def show          # GET /restaurants/:id
    @restaurant = Restaurant.find(params[:id])
  end

  def new           # GET /restaurants/new
    @restaurant = Restaurant.new
  end

  def create        # POST /restaurants
     @restaurant = Restaurant.new(restaurant_params)
     # @restaurant.save
     # als goed wordt gesaved, ga dan weer naar homepage, anders opnieuw naar pagina om nieuw restaurant aan te maken
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
  end

  def destroy       # DELETE /restaurants/:id
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    # params
    # => { id: '1', restaurant: { name: "Loetjes", address: "Amsterdam" } }

    # params.require(:restaurant)
    # => { name: "Loetjes", address: "Amsterdam", featured: true }

    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    # => { name: "Loetjes", address: "Amsterdam" }
  end
end
