class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    @routes = Route.all
  end

  def show; end

  def new
    @route = Route.new
  end

  def edit; end

  def create
    @route = Route.new(route_params)
    @route.railway_stations << RailwayStation.where(id: params[:route][:railway_stations])
    if @route.save
      redirect_to admin_routes_path
    else
      render :new
    end
  end

  def update
    @route.railway_stations = RailwayStation.where(id: params[:route][:railway_stations])
    if @route.update(route_params)
      redirect_to [:admin, @route]
    else
      render :new
    end
  end

  def destroy
    @route.destroy
    redirect_to admin_routes_path
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name)
  end
end
