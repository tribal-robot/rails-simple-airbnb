class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def search
    if params[:search].blank?
      redirect_to flats_path
    else
      @query = params[:search].downcase
      @flats = Flat.where('lower(name) LIKE :search', search: "%#{@query}%")
    end
  end

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render new_flat_path
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)

    redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy

    redirect_to flats_path, status: :see_other
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
