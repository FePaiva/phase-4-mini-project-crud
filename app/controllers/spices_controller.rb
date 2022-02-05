class SpicesController < ApplicationController

  def index
    render json: Spice.all
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

    def update
      spice = find_by_id
      spice.update(spice_params)
      render json: spice, status: :ok
    end

    def destroy
      spice = find_by_id
      spice.destroy
    end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end

  def find_by_id
    @spice = Spice.find_by(id: params[:id])
  end

end
