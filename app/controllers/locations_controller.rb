class LocationsController < ApplicationController
  # GET /locations
  def index
    render json: Location.all
  end

  # GET /locations/:id
  def show
    if params[:survivor_id]
      return render json: Survivor.find(params[:survivor_id]).location
    end
      
    render json: Location.find(params[:id])
  end
end
